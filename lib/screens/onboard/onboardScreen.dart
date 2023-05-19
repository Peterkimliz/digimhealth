import 'package:digimhealth/screens/auth/login_landing.dart';
import 'package:digimhealth/screens/onboard/onboard_screen_one.dart';
import 'package:digimhealth/screens/onboard/onboard_screen_three.dart';
import 'package:digimhealth/screens/onboard/onboard_screen_two.dart';
import 'package:digimhealth/widgets/major_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

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

            Center(
                child: SmoothPageIndicator(
              controller: pageController,
              // PageController
              count: 3,
              onDotClicked: (index) => pageController.animateToPage(index,
                  duration: Duration(milliseconds: 500), curve: Curves.easeIn),
              effect: WormEffect(
                  spacing: 16,
                  dotHeight: 10,
                  dotColor: Colors.grey,
                  activeDotColor: Styles.mainColor),
            )),

            Container(
              height: 60,
              margin: EdgeInsets.all(35),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Styles.mainColor,
                  borderRadius: BorderRadius.circular(15)),
              child: ElevatedButton(
                  onPressed: () {
                    if (pageNumber == 2) {
                      Get.to(() => LoginLanding());
                    } else {
                      pageController.nextPage(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeInOut);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 0.0,
                      primary: Styles.mainColor,
                      padding:
                          EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                      textStyle:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                  child: Center(
                      child: MajorTitle(
                    title: pageNumber == 2 ? "Get Started " : "Next",
                    color: Colors.white,
                    size: 20,
                  ))),
            )
            // Container(
            //   color: Styles.mainColor,
            //   padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5)
            //       .copyWith(bottom: 20),
            //   child: Column(
            //     children: [
            //       DotsIndicator(
            //         dotsCount: data.length,
            //
            //         position: pageNumber.toDouble(),
            //         decorator: DotsDecorator(
            //           activeColor: Colors.orange,
            //           color: Colors.white,
            //           spacing: const EdgeInsets.all(10.0),
            //         ),
            //       ),
            //       // Padding(
            //       //   padding: const EdgeInsets.symmetric(horizontal: 30.0),
            //       //   child: Row(
            //       //     children: [
            //       //       Expanded(
            //       //         child: InkWell(
            //       //           onTap: () {
            //       //             Get.to(() => LoginPage());
            //       //           },
            //       //           child: Container(
            //       //             padding: EdgeInsets.all(10),
            //       //             decoration: BoxDecoration(
            //       //                 borderRadius: BorderRadius.circular(10),
            //       //                 border: Border.all(
            //       //                     color: Colors.white, width: 1)),
            //       //             child: Center(
            //       //               child: Text(
            //       //                 "Log In",
            //       //                 style: TextStyle(color: Colors.white),
            //       //               ),
            //       //             ),
            //       //           ),
            //       //         ),
            //       //       ),
            //       //       SizedBox(width: 20),
            //       //       Expanded(
            //       //           child: InkWell(
            //       //         onTap: () {
            //       //           Get.to(() => Signup());
            //       //         },
            //       //         child: Container(
            //       //           padding: EdgeInsets.all(10),
            //       //           decoration: BoxDecoration(
            //       //             color: Colors.white,
            //       //             borderRadius: BorderRadius.circular(10),
            //       //           ),
            //       //           child: Center(
            //       //             child: Text(
            //       //               "Sign Up",
            //       //               style: TextStyle(color: Styles.mainColor),
            //       //             ),
            //       //           ),
            //       //         ),
            //       //       ))
            //       //     ],
            //       //   ),
            //       // ),
            //       SizedBox(height: 30),
            //       // Row(
            //       //   mainAxisAlignment: MainAxisAlignment.center,
            //       //   children: [
            //       //     Text(
            //       //       "Are you a doctor?",
            //       //       style: TextStyle(color: Colors.white),
            //       //     ),
            //       //     Text(
            //       //       "Get here!",
            //       //       style: TextStyle(
            //       //           decoration: TextDecoration.underline,
            //       //           color: Colors.white),
            //       //     ),
            //       //   ],
            //       // )
            //     ],
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
