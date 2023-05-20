import 'package:digimhealth/utils/styles.dart';
import 'package:digimhealth/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

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
        leading: commonWidget(icon: Icons.arrow_back,
            onPressed: () {
              Get.back();
            }),
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
              RatingBar.builder(
                initialRating: 1,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Styles.mainColor,
                ),
                onRatingUpdate: (rating) {

                },
              ),
              SizedBox(height: 10),
              Divider(thickness: 0.5, color: Colors.grey),
              SizedBox(height: 10),
              MajorTitle(
                title: "Write a Review",
                color: Colors.black,
                size: 15,
              ),
              SizedBox(height: 10),
              TextFormField(
                minLines: 8,
                maxLines: 8,
                decoration: InputDecoration(
                  hintText: "Your review here...",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                    borderSide: BorderSide(color: Styles.mainColor, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                    borderSide: BorderSide(color: Styles.mainColor, width: 1),
                  ),
                ),
              ),
              SizedBox(height: 30),
              customButton(
                  callback: () {
                    Get.back();
                  },
                  title: "Leave a Review")
            ],
          ),
        ),
      ),
    );
  }
}
