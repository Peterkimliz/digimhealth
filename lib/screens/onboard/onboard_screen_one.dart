import 'package:digimhealth/screens/onboard/onboard_widget.dart';
import 'package:digimhealth/utils/styles.dart';
import 'package:flutter/material.dart';




class OnboardScreenOne extends StatelessWidget {
  OnboardScreenOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: onBoardWidget(
            context: context,
            image:  "assets/images/doctors.png",
            title:  "Doctor Appointments",
            description:  "Appoint your doctor"),
      ),
    );
  }
}
