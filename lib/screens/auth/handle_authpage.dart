import 'package:digimhealth/controllers/authController.dart';
import 'package:digimhealth/screens/doctor/doctor_home.dart';
import 'package:digimhealth/screens/doctor/doctor_verification_page.dart';
import 'package:digimhealth/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/user_model.dart';
import '../../widgets/loader.dart';
import '../onboard/onboardScreen.dart';

class HandleAuthPage extends StatelessWidget {
  HandleAuthPage({Key? key}) : super(key: key);
  AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    if (authController.getUserType() == null &&
        authController.getUserId() == null) {
      return OnboardScreen();
    } else {
      return FutureBuilder(
          future: authController.getUser(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Scaffold(
                body: Center(
                  child: Loader(),
                ),
              );
            }
            if (snapshot.hasData == true) {
              authController.currentUser.value = snapshot.data as UserModel?;
              authController.currentUser.refresh();
              if (authController.currentUser.value!.type == "doctor") {

                if (authController.currentUser.value!.isVerified == false) {
                  return DoctorVerificationPage();
                } else {
                  return DoctorHome();
                }
              } else {
                return Home();
              }
            }

            return OnboardScreen();
          });
    }
  }
}
