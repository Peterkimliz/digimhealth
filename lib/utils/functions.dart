import 'package:digimhealth/screens/home/home.dart';
import 'package:digimhealth/utils/styles.dart';
import 'package:digimhealth/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../screens/appointments/appointment_details.dart';

successCancelDialog(context) {
  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return StatefulBuilder(builder: (context, setState) {
          return Container(
            padding: EdgeInsets.all(15),
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.8,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Material(
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/success.jpeg",
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.3,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Cancel Appointment Success!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Styles.mainColor,
                        fontSize: 28,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "We are sad  that you have canceled your appointment, we will improve our service to satisfy you in the next appointment.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                    ),
                  ),
                  Spacer(),
                  customButton(
                      callback: () {
                        Get.to(() => Home());
                      },
                      title: "Ok"),
                  Spacer(),
                ],
                crossAxisAlignment: CrossAxisAlignment.start,
              ),
            ),
          );
        });
      });
}

successReviewDialog(context) {
  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return StatefulBuilder(builder: (context, setState) {
          return Container(
            padding: EdgeInsets.all(15),
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.8,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Material(
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/success.jpeg",
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.3,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Cancel Appointment Success!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Styles.mainColor,
                        fontSize: 28,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "We are sad  that you have canceled your appointment, we will improve our service to satisfy you in the next appointment.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                    ),
                  ),
                  Spacer(),
                  customButton(
                      callback: () {
                        Get.to(() => Home());
                      },
                      title: "Ok"),
                  Spacer(),
                ],
                crossAxisAlignment: CrossAxisAlignment.start,
              ),
            ),
          );
        });
      });
}

successSheduleDialog(context, title) {
  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return StatefulBuilder(builder: (context, setState) {
          return Container(
            padding: EdgeInsets.all(15),
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.8,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Material(
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/success.jpeg",
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.3,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "${title} Success!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Styles.mainColor,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Appointment successfully Made you will receive notification",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                    ),
                  ),
                  Spacer(),
                  customButton(
                      callback: () {
                        Get.back();
                        Get.to(() => AppointmentDetails());
                      },
                      title: "View Appointment"),
                  SizedBox(height: 10),
                  customButton(
                      color: Styles.mainColor.withOpacity(0.2),
                      textColor: Styles.mainColor,
                      callback: () {
                        Get.to(() => Home());
                      },
                      title: "Cancel"),
                  Spacer(),
                ],
                crossAxisAlignment: CrossAxisAlignment.start,
              ),
            ),
          );
        });
      });
}

List<String> createTimeSlot(
    Duration startTime, Duration endTime, BuildContext context,
    {Duration step = const Duration(minutes: 60)}) {
  var timeSlot = <String>[];
  var hourStartTime = startTime.inHours;
  var minuteStartTime = startTime.inMinutes.remainder(60);

  var hourEndTime = endTime.inHours;
  var minuteEndTime = endTime.inMinutes.remainder(60);

  do {
    timeSlot.add(TimeOfDay(hour: hourStartTime, minute: minuteStartTime)
        .format(context));
    minuteStartTime += step.inMinutes;
    while (minuteStartTime >= 60) {
      minuteStartTime -= 60;
      hourStartTime++;
    }
  } while (hourStartTime < hourEndTime ||
      (hourStartTime == hourEndTime && minuteStartTime <= minuteEndTime));

  return timeSlot;
}
