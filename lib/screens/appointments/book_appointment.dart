import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:digimhealth/controllers/appointment_controler.dart';
import 'package:digimhealth/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/back_button.dart';
import '../../widgets/major_title.dart';

class BookAppointment extends StatelessWidget {
  BookAppointment({Key? key}) : super(key: key);
  AppointmentController appointmentController =
      Get.find<AppointmentController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.2,
        title: MajorTitle(title: "Book Appointment", color: Colors.black),
        backgroundColor: Colors.white,
        leading: backButton(icon: Icons.arrow_back),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                      child: Obx(() => InkWell(
                          onTap: () {
                            appointmentController
                                .selectedAppointmentType.value = 0;
                          },
                          child: selectionWidget(
                              title: "Online",
                              isSelected: appointmentController
                                          .selectedAppointmentType.value ==
                                      0
                                  ? true
                                  : false)))),
                  SizedBox(width: 10),
                  Expanded(
                      child: Obx(() => InkWell(
                            onTap: () {
                              appointmentController
                                  .selectedAppointmentType.value = 1;
                            },
                            child: selectionWidget(
                                title: "Physical",
                                isSelected: appointmentController
                                            .selectedAppointmentType.value ==
                                        1
                                    ? true
                                    : false),
                          ))),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              MajorTitle(
                title: "Select Hour",
                color: Colors.black,
                size: 17,
              ),
              CalendarDatePicker2(
                config: CalendarDatePicker2Config(
                  calendarType: CalendarDatePicker2Type.single,
                ),
                value: [DateTime.now()],
                onValueChanged: (dates) {
                  // _dates = dates
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget selectionWidget({required title, required bool isSelected}) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: isSelected ? Styles.mainColor : Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Styles.mainColor, width: 1),
      ),
      child: Center(
        child: MajorTitle(
            title: title, color: isSelected ? Colors.white : Styles.mainColor),
      ),
    );
  }
}
