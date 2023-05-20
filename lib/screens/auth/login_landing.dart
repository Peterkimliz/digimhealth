import 'package:digimhealth/controllers/authController.dart';
import 'package:digimhealth/screens/auth/components/build_email.dart';
import 'package:digimhealth/screens/auth/components/build_password.dart';
import 'package:digimhealth/screens/auth/register.dart';
import 'package:digimhealth/utils/styles.dart';
import 'package:digimhealth/widgets/major_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/loader.dart';
import '../../widgets/minor_title.dart';

class LoginLanding extends StatelessWidget {
  LoginLanding({Key? key}) : super(key: key);
  AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(builder: (context, constraint) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraint.maxHeight),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        Colors.grey.withOpacity(0.1),
                        Colors.white,
                      ],
                      begin: const FractionalOffset(0.0, 1.0),
                      end: const FractionalOffset(1.0, 0.0),
                      stops: [0.0, 1.0],
                      tileMode: TileMode.clamp),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.4,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30),
                          )),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Spacer(),
                            Center(
                              child: Image.asset(
                                "assets/images/log.png",
                                // height: 50,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Spacer(),
                            TabBar(
                                labelColor: Styles.mainColor,
                                unselectedLabelColor: Styles.mainColor,
                                indicatorPadding:
                                    EdgeInsets.symmetric(horizontal: 30),
                                indicatorWeight: 3,
                                indicatorColor: Styles.mainColor,
                                labelStyle: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                                controller: authController.tabController,
                                onTap: (value) {
                                  authController.textEditingControllerPassword
                                      .clear();
                                  authController.textEditingControllerEmail
                                      .clear();
                                  authController.hidePasword.value = false;
                                },
                                tabs: [
                                  Tab(text: "Patient"),
                                  Tab(text: "Specialist")
                                ]),
                          ]),
                    ),
                    Expanded(
                        child: TabBarView(
                      controller: authController.tabController,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: MajorTitle(
                                  title: "Patient Login",
                                  color: Styles.mainColor,
                                  size: 25,
                                ),
                              ),
                              SizedBox(height: 20),
                              buildEmail(
                                  controller: authController
                                      .textEditingControllerEmail),
                              SizedBox(height: 20),
                              Obx(() => buildPassword(
                                  hint: "Password",
                                  obscured: authController.hidePasword.value,
                                  controller: authController
                                      .textEditingControllerPassword)),
                              SizedBox(height: 20),
                              Row(
                                children: [
                                  MajorTitle(
                                    title: "Dont have an account?",
                                    color: Colors.black,
                                    size: 20,
                                  ),
                                  SizedBox(
                                    width: 3,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Get.to(() => Register(),
                                          transition:
                                              Transition.rightToLeftWithFade,
                                          duration:
                                              Duration(milliseconds: 1000));
                                    },
                                    child: MajorTitle(
                                        title: "Register",
                                        color: Styles.mainColor,
                                        size: 20),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),
                              Obx(() {
                                return authController.authUserLoad.value
                                    ? Center(child: Loader())
                                    : ElevatedButton(
                                        onPressed: () {
                                          if (authController
                                                  .textEditingControllerEmail
                                                  .text
                                                  .isNotEmpty &&
                                              authController
                                                  .textEditingControllerPassword
                                                  .text
                                                  .isNotEmpty) {
                                            authController.loginUser(
                                                context: context);
                                          } else {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(new SnackBar(
                                              content: MinorTitle(
                                                  title:
                                                      "please fill out all fields",
                                                  color: Colors.white),
                                              backgroundColor: Colors.black54,
                                            ));
                                          }
                                        },
                                        style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                            elevation: 0.0,
                                            primary: Styles.mainColor,
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 50, vertical: 20),
                                            textStyle: TextStyle(
                                                fontSize: 30,
                                                fontWeight: FontWeight.bold)),
                                        child: Center(
                                            child: MajorTitle(
                                          title: "Login",
                                          color: Colors.white,
                                          size: 20,
                                        )));
                              })
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: MajorTitle(
                                  title: "Specialist Login",
                                  color: Styles.mainColor,
                                  size: 25,
                                ),
                              ),
                              SizedBox(height: 20),
                              buildEmail(
                                  controller: authController
                                      .textEditingControllerEmail),
                              SizedBox(height: 20),
                              Obx(() => buildPassword(
                                  hint: "Password",
                                  controller: authController
                                      .textEditingControllerPassword,
                                  obscured: authController.hidePasword.value)),
                              SizedBox(height: 20),
                              Row(
                                children: [
                                  MajorTitle(
                                    title: "Dont have an account?",
                                    color: Colors.black,
                                    size: 20,
                                  ),
                                  SizedBox(
                                    width: 3,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Get.to(() => Register(),
                                          transition: Transition.rightToLeftWithFade,
                                          duration: Duration(milliseconds: 1000));
                                    },
                                    child: MajorTitle(
                                        title: "Register",
                                        color: Styles.mainColor,
                                        size: 20),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),
                              Obx(() {
                                return authController.authUserLoad.value
                                    ? Center(child: Loader())
                                    : ElevatedButton(
                                        onPressed: () {
                                          if (authController
                                                  .textEditingControllerEmail
                                                  .text
                                                  .isNotEmpty &&
                                              authController
                                                  .textEditingControllerPassword
                                                  .text
                                                  .isNotEmpty) {
                                            authController.loginUser(
                                                context: context);
                                          } else {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(new SnackBar(
                                              content: MinorTitle(
                                                  title:
                                                      "please fill out all fields",
                                                  color: Colors.white),
                                              backgroundColor: Colors.black54,
                                            ));
                                          }
                                        },
                                        style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                            elevation: 0.0,
                                            primary: Styles.mainColor,
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 50, vertical: 20),
                                            textStyle: TextStyle(
                                                fontSize: 30,
                                                fontWeight: FontWeight.bold)),
                                        child: Center(
                                            child: MajorTitle(
                                          title: "Login",
                                          color: Colors.white,
                                          size: 20,
                                        )));
                              })
                            ],
                          ),
                        ),
                      ],
                    ))
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
