import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shooping_app/routes/app_routes.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Get.toNamed(AppRoutes.categoryItemRoute);
              },
              child: Container(
                width: double.infinity,
                height: 150,
                decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: NetworkImage(
                            'https://res.cloudinary.com/practicaldev/image/fetch/s--jIjY95PE--/c_imagga_scale,f_auto,fl_progressive,h_900,q_auto,w_1600/https://images.unsplash.com/photo-1529675641475-78780f1fd4b0%3Fixlib%3Drb-1.2.1%26ixid%3DeyJhcHBfaWQiOjEyMDd9%26auto%3Dformat%26fit%3Dcrop%26w%3D1350%26q%3D80'),
                        fit: BoxFit.cover)),
                child: Padding(
                  padding: EdgeInsets.only(left: 20, bottom: 10),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      'mens',
                      style: TextStyle(
                          backgroundColor: Colors.black38,
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(
              height: 20,
            );
          },
          itemCount: 4),
    );
  }
}
