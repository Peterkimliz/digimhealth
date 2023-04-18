import 'package:digimhealth/screens/chats/inbox_page.dart';
import 'package:digimhealth/screens/doctor/components/doctor_card.dart';
import 'package:digimhealth/widgets/back_button.dart';
import 'package:digimhealth/widgets/major_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../utils/styles.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/minor_title.dart';

class AppointmentDetails extends StatelessWidget {
  AppointmentDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:
            commonWidget(icon: Icons.arrow_back, onPressed: () => Get.back()),
        title: MajorTitle(title: "Appointment Details", color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              doctorCard(isVisible: false),
              SizedBox(height: 20),
              MajorTitle(title: "Sheduled Apppointment", color: Colors.black),
              SizedBox(height: 20),
              MinorTitle(title: "Today ${DateFormat("MMMM dd, yyyy").format(DateTime.now())}", color: Colors.black),
              SizedBox(height: 10),
              MinorTitle(title: "10:00-12:00PM (120 minutes) ", color: Colors.black),
              SizedBox(height: 20),
              MajorTitle(title: "Patient Information", color: Colors.black),
              SizedBox(height: 10),
              MinorTitle(title: "Full Name : John Doe", color: Colors.black),
              SizedBox(height: 10),
              MinorTitle(title: "Gender :  Male", color: Colors.black),
              SizedBox(height: 10),
              MinorTitle(title: "Age : 10-30", color: Colors.black),
              SizedBox(height: 10),
              MinorTitle(title: "Problem : hello hello hello", color: Colors.black),
              SizedBox(height: 50),
              Container(
                padding: EdgeInsets.all(10),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(1, 1),
                          blurRadius: 2,
                          color: Colors.grey)
                    ]),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: Styles.mainColor.withOpacity(0.3),
                          shape: BoxShape.circle),
                      child: Icon(
                        Icons.video_call,
                        color: Styles.mainColor,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MajorTitle(
                              title: "Live Stream Meating",
                              color: Colors.black),
                          SizedBox(height: 10),
                          MinorTitle(
                              title: "Video confrence with doctor",
                              color: Colors.grey),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        MajorTitle(title: "\$20", color: Styles.mainColor),
                        SizedBox(height: 10),
                        MajorTitle(
                          title: "30 minutes",
                          color: Colors.black,
                          size: 12,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 30),
              customButton(callback: () {
                Get.to(()=>InboxPage());
              }, title: "Message"),
            ],
          ),
        ),
      ),
    );
  }
}
