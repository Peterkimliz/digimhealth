import 'package:digimhealth/controllers/appointment_controler.dart';
import 'package:digimhealth/utils/functions.dart';
import 'package:digimhealth/utils/styles.dart';
import 'package:digimhealth/widgets/custom_button.dart';
import 'package:digimhealth/widgets/minor_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/back_button.dart';
import '../../widgets/major_title.dart';

class ResheduleCancelAppointment extends StatelessWidget {
  final title;
  List cancelReason = [
    {"value": "0", "name": "i just want to cancel"},
    {"value": "1", "name": "i don't want to consult"},
    {"value": "2", "name": "i want to change package"},
    {"value": "3", "name": "i don't want to tell"},
    {"value": "4", "name": "Others"}
  ];
  List resheduleReason = [
    {"value": "0", "name": "I'm having a shedule clash"},
    {"value": "1", "name": "i'm not available on shedule"},
    {"value": "2", "name": "I have an activity that can't be left behind"},
    {"value": "3", "name": "i don't want to tell"},
    {"value": "4", "name": "Others"}
  ];

  ResheduleCancelAppointment({Key? key, required this.title}) : super(key: key);
  AppointmentController appointmentController =
      Get.find<AppointmentController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.2,
        title: MajorTitle(title: "${title} Appointment", color: Colors.black),
        backgroundColor: Colors.white,
        leading: backButton(icon: Icons.arrow_back),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              MajorTitle(
                title: "Reason for ${title} appointment",
                color: Colors.black,
                size: 15,
              ),
              ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: title.toString().toLowerCase() == "cancel"
                      ? cancelReason.length
                      : resheduleReason.length,
                  itemBuilder: (context, index) {
                    return Obx(() => RadioListTile(
                          activeColor: Styles.mainColor,
                          contentPadding: EdgeInsets.all(0),
                          dense: true,
                          title: MinorTitle(
                            title: title.toString().toLowerCase() == "cancel"
                                ? cancelReason[index]["name"]
                                : resheduleReason[index]["name"],
                            color: Colors.black,
                            size: 13,
                          ),
                          value: title.toString().toLowerCase() == "cancel"
                              ? cancelReason[index]["value"]
                              : resheduleReason[index]["value"],
                          groupValue: title.toString().toLowerCase() == "cancel"
                              ? appointmentController.cancelValue.value
                              : appointmentController.resheduleValue.value,
                          onChanged: (value) {
                            if (title.toString().toLowerCase() == "cancel") {
                              appointmentController.cancelValue.value = value;
                            } else {
                              appointmentController.resheduleValue.value =
                                  value;
                            }
                          },
                        ));
                  }),
              SizedBox(height: 10),
              TextFormField(
                minLines: 8,
                maxLines: 8,
                decoration: InputDecoration(
                  hintText: "${title} Reason",
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
              SizedBox(height: 20),
              customButton(
                  callback: () {
                    if (title.toString().toLowerCase() == "cancel") {
                      successCancelDialog(context);
                    } else {
                      successSheduleDialog(context, title);
                    }
                  },
                  title: "Submit"),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
