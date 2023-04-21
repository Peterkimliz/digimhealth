import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:digimhealth/controllers/appointment_controler.dart';
import 'package:digimhealth/screens/appointments/packages_page.dart';
import 'package:digimhealth/utils/styles.dart';
import 'package:digimhealth/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/functions.dart';
import '../../widgets/back_button.dart';
import '../../widgets/major_title.dart';

class BookAppointment extends StatelessWidget {
  BookAppointment({Key? key}) : super(key: key);
  AppointmentController appointmentController =
      Get.find<AppointmentController>();

  @override
  Widget build(BuildContext context) {
    List hours = createTimeSlot(Duration(hours: 8, minutes: 30),
        Duration(hours: 18, minutes: 30), context);
    print(hours.toList());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.2,
        title: MajorTitle(title: "Book Appointment", color: Colors.black),
        backgroundColor: Colors.white,
        leading: commonWidget(
            icon: Icons.arrow_back,
            onPressed: () {
              Get.back();
            }
            ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              MajorTitle(
                title: "Select Date",
                color: Colors.black,
                size: 17,
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Styles.mainColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(10)),
                child: CalendarDatePicker2(
                  config: CalendarDatePicker2Config(
                    selectedDayHighlightColor: Styles.mainColor,
                    calendarType: CalendarDatePicker2Type.single,
                  ),
                  value: [DateTime.now()],
                  onValueChanged: (dates) {
                    // _dates = dates
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              MajorTitle(
                title: "Select Hour",
                color: Colors.black,
                size: 17,
              ),
              SizedBox(
                height: 10,
              ),
              Wrap(
                runSpacing: 6.0,
                spacing: 6.0,
                children: createTimeSlot(Duration(hours: 8, minutes: 30),
                        Duration(hours: 18, minutes: 30), context)
                    .map((e) => Obx(() => InkWell(
                          onTap: () {
                            appointmentController.selectedHour.value = e;
                          },
                          child: Chip(
                              backgroundColor:
                                  appointmentController.selectedHour.value == e
                                      ? Styles.mainColor
                                      : Colors.white,
                              shape: StadiumBorder(
                                  side: BorderSide(
                                width: 1,
                                color: Styles.mainColor,
                              )),
                              label: Text(
                                e,
                                style: TextStyle(
                                    color: appointmentController
                                                .selectedHour.value ==
                                            e
                                        ? Colors.white
                                        : Styles.mainColor),
                              )),
                        )))
                    .toList(),
              ),
              SizedBox(
                height: 10,
              ),
              customButton(
                  callback: () {
                    Get.to(() => Packages());
                  },
                  title: "Next")
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
