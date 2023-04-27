import 'package:digimhealth/controllers/authController.dart';
import 'package:digimhealth/screens/auth/components/background_image.dart';
import 'package:digimhealth/screens/auth/components/decoration.dart';
import 'package:digimhealth/screens/auth/doctor_login.dart';
import 'package:digimhealth/widgets/major_title.dart';
import 'package:digimhealth/widgets/minor_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../utils/styles.dart';

class DoctorRegister extends StatelessWidget {
  DoctorRegister({Key? key}) : super(key: key) {
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
                      title: "Register",
                      color: Colors.white,
                      size: 30,
                    ),
                    SizedBox(height: 5),
                    MinorTitle(
                      title: "Create account",
                      color: Colors.white,
                      size: 16,
                    ),
                    SizedBox(height: 30),
                    TextFormField(
                      controller: authController.textEditingControllerName,
                      keyboardType: TextInputType.text,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w500),
                      decoration: inputDecoration(text: "Username"),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: authController.textEditingControllerEmail,
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w500),
                      decoration: inputDecoration(text: "Email"),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: authController.textEditingControllerPhone,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w500),
                      decoration: inputDecoration(text: "Phone"),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: authController.textEditingControllerPassword,
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w500),
                      decoration: inputDecoration(text: "Password"),
                    ),
                    SizedBox(height: 40),
                    Align(
                      alignment: Alignment.center,
                      child: InkWell(
                        onTap: () {
                          if (authController.isValidated()) {
                            authController.createUser(
                                context: context, type: "doctor");
                          } else {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(new SnackBar(
                              content: MinorTitle(
                                  title: authController.errorMessage.value,
                                  color: Colors.white),
                              backgroundColor: Colors.black,
                            ));
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
                              MajorTitle(title: "Sign up", color: Colors.white),
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
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MinorTitle(
                          title: "Already have an account?",
                          color: Colors.white,
                          size: 20,
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(() => DoctorLogin(),
                                transition: Transition.leftToRightWithFade,
                                duration: Duration(milliseconds: 1000));
                          },
                          child: MajorTitle(
                              title: "Sign In",
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
