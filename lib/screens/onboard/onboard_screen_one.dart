import 'package:digimhealth/screens/onboard/onboard_widget.dart';
import 'package:digimhealth/utils/styles.dart';
import 'package:flutter/material.dart';


// SizedBox(
// width: 200.0,
// height: 100.0,
// child: Shimmer.fromColors(
// baseColor: Colors.red,
// highlightColor: Colors.yellow,
// child: Text(
// 'Shimmer',
// textAlign: TextAlign.center,
// style: TextStyle(
// fontSize: 40.0,
// fontWeight:
// FontWeight.bold,
// ),
// ),
// ),
// );


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
