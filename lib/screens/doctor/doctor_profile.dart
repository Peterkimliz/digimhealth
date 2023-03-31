import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/major_title.dart';

class DoctorProfile  extends StatelessWidget {
  const DoctorProfile ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.2,
        title: MajorTitle(title: "Doctor", color: Colors.black),
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
      ),
    );
  }
}
