import 'package:digimhealth/controllers/appointment_controler.dart';
import 'package:digimhealth/screens/appointments/payment_page.dart';
import 'package:digimhealth/widgets/back_button.dart';
import 'package:digimhealth/widgets/major_title.dart';
import 'package:digimhealth/widgets/minor_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/styles.dart';
import '../../widgets/custom_button.dart';

class Packages extends StatelessWidget {
  AppointmentController appointmentController =
      Get.find<AppointmentController>();

  Packages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: commonWidget(
            icon: Icons.arrow_back,
            onPressed: () {
              Get.back();
            }),
        title: MajorTitle(title: "Packages", color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            MajorTitle(title: "Select Duration (Min)", color: Colors.black),
            SizedBox(height: 10),
            DropdownButtonFormField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey.withOpacity(0.2),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.transparent, width: 0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.transparent, width: 0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.transparent, width: 0),
                ),
              ),
              items: appointmentController.durations
                  .map(
                    (e) => DropdownMenuItem(
                  onTap: () {
                    appointmentController.selectedDuration.value = int.parse(e);
                  },
                  value: e,
                  child: Text(e),
                ),
              )
                  .toList(),
              onChanged: (value) {},
            ),
            SizedBox(height: 30),
            MajorTitle(title: "Select Package", color: Colors.black),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(10),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(1, 1), blurRadius: 2, color: Colors.grey)
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MajorTitle(
                                title: "Live Stream Meating",
                                color: Colors.black),
                            MajorTitle(title: "\$20", color: Colors.black),
                          ],
                        ),
                        SizedBox(height: 10),
                        MinorTitle(
                            title: "Live Stream with he doctor for 30 minutes",
                            color: Colors.grey),
                      ],
                    ),
                  ),
                  Radio(
                    value: false,
                    groupValue: false,
                    onChanged: (value) {},
                    fillColor: MaterialStateProperty.all(Styles.mainColor),
                  )
                ],
              ),
            ),
            SizedBox(height: 25),
            Container(
              padding: EdgeInsets.all(10),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(1, 1), blurRadius: 2, color: Colors.grey)
                  ]),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: Styles.mainColor.withOpacity(0.3),
                        shape: BoxShape.circle),
                    child: Icon(
                      Icons.offline_bolt,
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MajorTitle(
                                title: "Offline Meeting ", color: Colors.black),
                            MajorTitle(title: "\$20", color: Colors.black),
                          ],
                        ),
                        SizedBox(height: 10),
                        MinorTitle(
                            title:
                                "Meet impersonal with he doctor for 30 minutes",
                            color: Colors.grey),
                      ],
                    ),
                  ),
                  Radio(
                    value: false,
                    groupValue: false,
                    onChanged: (value) {},
                    fillColor: MaterialStateProperty.all(Styles.mainColor),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            customButton(
                callback: () {
                  Get.to(() => PaymentPage());
                },
                title: "Next"),
          ],
        ),
      ),
    );
  }
}
