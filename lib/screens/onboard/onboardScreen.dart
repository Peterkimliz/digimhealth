import 'package:digimhealth/screens/auth/doctor_login.dart';
import 'package:digimhealth/screens/auth/login.dart';
import 'package:digimhealth/screens/auth/sign-up.dart';
import 'package:digimhealth/screens/onboard/onboard_screen_one.dart';
import 'package:digimhealth/screens/onboard/onboard_screen_three.dart';
import 'package:digimhealth/screens/onboard/onboard_screen_two.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/styles.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({Key? key}) : super(key: key);

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  late PageController pageController;
  int pageNumber = 0;
  List<Widget> data = [
    OnboardScreenOne(),
    OnboardScreenTwo(),
    OnboardScreenThree()
  ];

  @override
  void initState() {
    pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    pageNumber = value;
                  });
                  print(pageNumber);
                },
                controller: pageController,
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return data[index];
                },
              ),
            ),
            Container(
              color: Styles.mainColor,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5)
                  .copyWith(bottom: 20),
              child: Column(
                children: [
                  DotsIndicator(
                    dotsCount: data.length,
                    position: pageNumber.toDouble(),
                    decorator: DotsDecorator(
                      activeColor: Colors.orange,
                      color: Colors.white,
                      spacing: const EdgeInsets.all(10.0),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              Get.to(() => LoginPage(),
                                  transition: Transition.zoom,
                                  duration: Duration(milliseconds: 1000));
                            },
                            child: Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: Colors.white, width: 1)),
                              child: Center(
                                child: Text(
                                  "Log In",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 20),
                        Expanded(
                            child: InkWell(
                          onTap: () {
                            Get.to(() => Signup(),
                                transition: Transition.zoom,
                                duration: Duration(milliseconds: 1000));
                          },
                          child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                "Sign Up",
                                style: TextStyle(color: Styles.mainColor),
                              ),
                            ),
                          ),
                        ))
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Are you a doctor?",
                        style: TextStyle(color: Colors.white),
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(() => DoctorLogin(),
                              transition: Transition.circularReveal,
                              duration: Duration(milliseconds: 1000));
                        },
                        child: Text(
                          "Get here!",
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.white),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
