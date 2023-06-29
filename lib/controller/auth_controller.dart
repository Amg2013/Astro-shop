import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../routes/app_routes.dart';

class AuthController extends GetxController {
  bool isVisibility = false;
  bool isCheckBox = false;
  FirebaseAuth auth = FirebaseAuth.instance;
  var googleSignIn = GoogleSignIn();
  var displayUserName = ''.obs;
  var displayUserPhoto = ''.obs;
  var displayUserEmail = ''.obs;
  bool isSignUp = false;
  final GetStorage authBox = GetStorage();

  User? get userProfile => auth.currentUser;

  @override
  void onInit() {
    displayUserName.value = userProfile?.displayName ?? '';
    displayUserPhoto.value = userProfile?.photoURL ?? '';
    displayUserEmail.value = userProfile?.email ?? '';
    super.onInit();
  }

  void visibility() {
    isVisibility = !isVisibility;
    update();
  }

  void checkBox() {
    isCheckBox = !isCheckBox;
    update();
  }

  void signUpUsingFirebase(
      {required String name,
      required String email,
      required String password}) async {
    try {
      await auth
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((value) {
        displayUserName.value = name;
        auth.currentUser!.updateDisplayName(name);
        displayUserEmail.value = email;
        auth.currentUser!.updateEmail(email);
      });
      isSignUp = true;
      authBox.write('isSignUp', isSignUp);
      update();
      Get.offNamed(AppRoutes.mainScreenRoute);
    } on FirebaseAuthException catch (error) {
      String title = error.code.replaceAll(RegExp('-'), ' ');
      String message = '';
      if (error.code == 'weak-password') {
        message = 'The password provided is too weak.';
      } else if (error.code == 'email-already-in-use') {
        message = 'The account already exists for that email.';
      } else {
        message = error.message.toString();
      }
      Get.snackbar(title, message,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
    } catch (error) {
      Get.snackbar('Error!', error.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
    }
  }

  void loginUsingFirebase(
      {required String email, required String password}) async {
    try {
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) =>
              displayUserName.value = auth.currentUser!.displayName!);
      isSignUp = true;
      authBox.write('isSignUp', isSignUp);
      update();
      Get.offNamed(AppRoutes.mainScreenRoute);
    } on FirebaseAuthException catch (error) {
      String title = error.code.replaceAll(RegExp('-'), ' ');
      String message = '';
      if (error.code == 'user-not-found') {
        message =
            'No user found for that $email...create your account by signing up..';
      } else if (error.code == 'wrong-password') {
        message = 'Wrong password please... try again! ';
      } else {
        message = error.message.toString();
      }
      Get.snackbar(title, message,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
    } catch (error) {
      Get.snackbar('Error!', error.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
    }
  }

  void googleSignUp() async {
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      displayUserName.value = googleUser!.displayName ?? '';
      displayUserPhoto.value = googleUser.photoUrl ?? '';
      displayUserEmail.value = googleUser.email;
      GoogleSignInAuthentication googleSignInAuthentication =
          await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);
      await auth.signInWithCredential(credential);
      isSignUp = true;
      authBox.write('isSignUp', isSignUp);
      update();
      Get.offNamed(AppRoutes.mainScreenRoute);
    } catch (error) {
      Get.snackbar('Error!', error.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
          titleText: Text(
            'error',
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          messageText: Text(
            error.toString(),
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          duration: Duration(seconds: 10));
    }
  }

  Future<void> resetPassword(String email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
      update();
    } on FirebaseAuthException catch (error) {
      String title = error.code.replaceAll(RegExp('-'), ' ');
      String message = '';
      if (error.code == 'user-not-found') {
        message =
            'No user found for that $email...create your account by signing up..';
      } else {
        message = error.message.toString();
      }
      Get.snackbar(title, message,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
    } catch (error) {
      Get.snackbar('Error!', error.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
    }
  }

  void signOutFromApp() async {
    try {
      await auth.signOut();
      await googleSignIn.signOut();
      displayUserName.value = '';
      displayUserPhoto.value = '';
      displayUserEmail.value = '';
      isSignUp = false;
      authBox.remove('isSignUp');
      update();
      Get.offNamed(AppRoutes.welcomeRoute);
    } catch (error) {
      Get.snackbar('Error!', error.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
    }
  }
}
