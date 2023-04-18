import 'package:digimhealth/widgets/back_button.dart';
import 'package:digimhealth/widgets/major_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Notifications extends StatelessWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: commonWidget(
            icon: Icons.arrow_back,
            onPressed: () {
              Get.back();
            }),
        title: MajorTitle(title: "Notifications", color: Colors.black),

      ),
      body: Container(),
    );
  }
}
