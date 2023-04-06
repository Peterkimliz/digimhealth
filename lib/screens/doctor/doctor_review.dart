import 'package:flutter/material.dart';

import '../../widgets/back_button.dart';
import '../../widgets/major_title.dart';

class DoctorReview extends StatelessWidget {
  DoctorReview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.2,
        title: MajorTitle(title: "Write a Review", color: Colors.black),
        backgroundColor: Colors.white,
        leading: backButton(icon: Icons.arrow_back),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Center(
                child: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage("assets/images/doctor4.jpg")),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "How was your experience with Dr. Peter lojis kim",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 10,
              ),
              Divider(thickness: 0.5,color: Colors.grey)
            ],
          ),
        ),
      ),
    );
  }
}
