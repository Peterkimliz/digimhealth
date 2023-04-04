import 'package:digimhealth/bindings.dart';
import 'package:digimhealth/controllers/UserController.dart';
import 'package:digimhealth/controllers/appointment_controler.dart';
import 'package:digimhealth/controllers/authController.dart';
import 'package:digimhealth/screens/onboard/onboardScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  AuthController authController = Get.put<AuthController>(AuthController());
  AppointmentController appointmentController =
      Get.put<AppointmentController>(AppointmentController());
  UserController userController = Get.put<UserController>(UserController());

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
          appBarTheme:
              AppBarTheme(backgroundColor: Colors.white, elevation: 0.0)),
      title: "DigiMHealth",
      home: OnboardScreen(),
      initialBinding: AppBindings(),
    );
  }
}
