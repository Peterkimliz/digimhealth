import 'package:digimhealth/screens/onboard/onboard_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OnboardScreenThree extends StatelessWidget {
  OnboardScreenThree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: onBoardWidget(
            context: context,
            image: "assets/images/getstarted.png",
            title: "Let's Get Started",
            description: "Consult With Doctor Now"));
  }
}
