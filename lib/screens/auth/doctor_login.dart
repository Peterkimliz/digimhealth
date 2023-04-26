import 'package:digimhealth/screens/auth/components/background_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DoctorLogin extends StatelessWidget {
  const DoctorLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          BackGroundImage(),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Get.back();
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
