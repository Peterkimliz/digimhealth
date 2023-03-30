import 'package:digimhealth/screens/onboard/onboard_widget.dart';
import 'package:flutter/cupertino.dart';

class OnboardScreenTwo extends StatelessWidget {
  const OnboardScreenTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: onBoardWidget(
            context: context,
            image: "assets/images/livetrial.jpg",
            title: "Live Sessions",
            description: "Book Live Session"));
  }
}
