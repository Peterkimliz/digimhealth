import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/major_title.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.2,
        centerTitle: true,
        title: MajorTitle(
          title: "About",
          color: Colors.black,
          size: 20,
        ),
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
