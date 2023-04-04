import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:square_in_app_payments/in_app_payments.dart';

class PaymentController extends GetxController {
  final phoneNumber = 'Phone number'.obs;
  var latitude = ''.obs;
  var longitude = ''.obs;
  final countryAddress = 'Your address'.obs;
  final streetAddress = ''.obs;

  //location

  Future<void> updatePosition() async {
    Position position = await _determinePosition();
    List<Placemark> placeMarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark place = placeMarks[0];
    countryAddress.value = "${place.country}";
    streetAddress.value = "${place.street}";
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition();
  }

  //Paypal sandbox payment

  Future<void> initSquarePayment() async {
    await InAppPayments.setSquareApplicationId(
        'sandbox-sq0idb-kw1AP4SAqjucwSR4PWYG-g');
  }
}
