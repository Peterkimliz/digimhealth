import 'package:digimhealth/screens/auth/components/textFields.dart';
import 'package:digimhealth/screens/auth/login.dart';
import 'package:digimhealth/screens/profile/profile_setup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/authController.dart';
import '../../utils/styles.dart';
import '../../widgets/back_button.dart';
import '../../widgets/custom_painter.dart';
import '../../widgets/major_title.dart';
import '../../widgets/minor_title.dart';

class Signup extends StatelessWidget {
  Signup({Key? key}) : super(key: key);
  AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  CustomPaint(
                    size: Size(MediaQuery.of(context).size.width, 200),
                    painter: RPSCustomPainter(),
                  ),
                  Positioned(
                    top: 10,
                    right: -5,
                    child: CustomPaint(
                      size: Size(MediaQuery.of(context).size.width, 200),
                      painter: RPSCustomPainter(),
                    ),
                  ),
                  Positioned(
                    child: backButton(icon: Icons.arrow_back),
                    left: 10,
                    top: 5,
                  ),
                  Positioned(
                      top: 130,
                      left: 10,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MajorTitle(
                            title: "Sign Up",
                            color: Colors.black,
                            size: 30,
                          ),
                          SizedBox(height: 10),
                          MinorTitle(
                              title: "Please sign in to continue.",
                              color: Colors.grey),
                        ],
                      ))
                ],
              ),
              SizedBox(height: 10),
              inputFields(
                  title: "Full name",
                  icon: Icons.person,
                  controller: authController.textEditingControllerName),
              inputFields(
                  title: "Email",
                  icon: Icons.email,
                  controller: authController.textEditingControllerEmail),
              inputFields(
                  title: "Phone",
                  icon: Icons.phone,
                  controller: authController.textEditingControllerPhone),
              inputFields(
                  title: "Password",
                  icon: Icons.lock,
                  isPassword: true,
                  controller: authController.textEditingControllerPassword,
                  isVisible: true),
              SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.center,
                child: InkWell(
                  onTap: () {
                    Get.to(() => ProfileSetup());
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: 20),
                    height: 50,
                    width: 150,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          Styles.mainColor,
                          Styles.mainColor.withOpacity(0.5)
                        ]),
                        borderRadius: BorderRadius.circular(30),
                        color: Styles.mainColor),
                    child: Row(
                      children: [
                        SizedBox(width: 20),
                        MajorTitle(title: "Sign Up", color: Colors.white),
                        SizedBox(width: 20),
                        Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MinorTitle(
                    title: "Already have an account?",
                    color: Colors.black,
                    size: 20,
                  ),
                  SizedBox(
                    width: 3,
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(() => LoginPage());
                    },
                    child: MajorTitle(
                        title: "Sign In", color: Styles.mainColor, size: 20),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
