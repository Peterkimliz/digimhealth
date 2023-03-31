import 'package:digimhealth/widgets/major_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/back_button.dart';

class AllDoctors extends StatelessWidget {
   AllDoctors({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.2,
        title: MajorTitle(title: "Doctors", color: Colors.black),
        backgroundColor: Colors.white,
        leading:  backButton(icon: Icons.arrow_back),
      ),
    );
  }
}
