import 'package:digimhealth/controllers/authController.dart';
import 'package:digimhealth/screens/auth/components/background_image.dart';
import 'package:digimhealth/screens/auth/components/decoration.dart';
import 'package:digimhealth/screens/auth/doctor_register.dart';
import 'package:digimhealth/widgets/major_title.dart';
import 'package:digimhealth/widgets/minor_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../utils/styles.dart';
import '../../widgets/loader.dart';

class DoctorLogin extends StatelessWidget {
  DoctorLogin({Key? key}) : super(key: key) {
    authController.clearInputs();
  }

  AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          BackGroundImage(),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    MajorTitle(
                      title: "Welcome back",
                      color: Colors.white,
                      size: 30,
                    ),
                    SizedBox(height: 5),
                    MinorTitle(
                      title: "Login in your account",
                      color: Colors.white,
                      size: 16,
                    ),
                    SizedBox(height: 70),
                    TextFormField(
                      controller: authController.textEditingControllerEmail,
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w500),
                      decoration: inputDecoration(text: "Email"),
                    ),
                    SizedBox(height: 40),
                    TextFormField(
                      controller: authController.textEditingControllerPassword,
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w500),
                      decoration: inputDecoration(text: "Password"),
                    ),
                    SizedBox(height: 10),
                    Align(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: MajorTitle(
                          title: "Forgot Password?",
                          color: Colors.white,
                          size: 17,
                        ),
                      ),
                      alignment: Alignment.topRight,
                    ),
                    SizedBox(height: 40),
                    Obx(() {
                      return authController.authUserLoad.value
                          ? Align(alignment: Alignment.center, child: Loader())
                          : Align(
                              alignment: Alignment.center,
                              child: InkWell(
                                onTap: () {
                                  if (authController.textEditingControllerEmail
                                          .text.isEmpty ||
                                      authController
                                          .textEditingControllerPassword
                                          .text
                                          .isEmpty) {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(new SnackBar(
                                      content: MajorTitle(
                                        title: "Please fill all the fields",
                                        color: Colors.white,
                                      ),
                                      backgroundColor: Colors.black,
                                    ));
                                  } else {
                                    authController.loginUser(context: context);
                                  }
                                },
                                child: Container(
                                  margin: EdgeInsets.only(right: 20),
                                  height: 50,
                                  width: 150,
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(colors: [
                                        Styles.mainColor,
                                        Styles.mainColor.withOpacity(0.8)
                                      ]),
                                      borderRadius: BorderRadius.circular(30),
                                      color: Styles.mainColor),
                                  child: Row(
                                    children: [
                                      SizedBox(width: 20),
                                      MajorTitle(
                                          title: "Login", color: Colors.white),
                                      SizedBox(width: 20),
                                      Icon(
                                        Icons.arrow_forward,
                                        color: Colors.white,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                    }),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MinorTitle(
                          title: "Dont have an account?",
                          color: Colors.white,
                          size: 20,
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(() => DoctorRegister(),
                                transition: Transition.rightToLeftWithFade,
                                duration: Duration(milliseconds: 1000));
                          },
                          child: MajorTitle(
                              title: "Sign up",
                              color: Styles.mainColor,
                              size: 20),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
