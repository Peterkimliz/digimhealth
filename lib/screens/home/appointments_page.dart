import 'package:digimhealth/controllers/appointment_controler.dart';
import 'package:digimhealth/screens/appointments/appointment_details.dart';
import 'package:digimhealth/screens/appointments/reshedule_cancel_appointment.dart';
import 'package:digimhealth/screens/doctor/doctor_review.dart';
import 'package:digimhealth/screens/doctor/doctors.dart';
import 'package:digimhealth/utils/styles.dart';
import 'package:digimhealth/widgets/back_button.dart';
import 'package:digimhealth/widgets/major_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../widgets/minor_title.dart';

class AppointmentsPage extends StatelessWidget {
  AppointmentsPage({Key? key}) : super(key: key);
  AppointmentController appointmentController =
      Get.find<AppointmentController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: MajorTitle(title: "Appointments", color: Colors.black),
        actions: [
          commonWidget(
              icon: Icons.add,
              onPressed: () {
                Get.to(() => AllDoctors());
              }),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: TabBar(
              controller: appointmentController.tabController,
              indicatorColor: Styles.mainColor,
              labelColor: Styles.mainColor,
              unselectedLabelColor: Colors.grey,
              onTap: (value) {},
              tabs: [
                Tab(text: "Upcoming"),
                Tab(text: "Completed"),
                Tab(text: "Cancelled"),
              ],
            ),
          ),
          Expanded(
              child: TabBarView(
            controller: appointmentController.tabController,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              Apointments(
                type: "Upcoming",
              ),
              Apointments(
                type: "Completed",
              ),
              Apointments(
                type: "Cancelled",
              ),
            ],
          ))
        ],
      ),
    );
  }
}

class Apointments extends StatelessWidget {
  final type;

  const Apointments({Key? key, required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: (){
              Get.to(()=>AppointmentDetails());
            },
            child: Container(
              width: MediaQuery.of(context).size.width * 0.7,
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 1,
                        offset: Offset(0.5, 0.5),
                        color: Colors.grey)
                  ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 80,
                            width: 80,
                            margin: EdgeInsets.only(right: 5),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image:
                                        AssetImage("assets/images/doctor4.jpg"),
                                    fit: BoxFit.cover)),
                          ),
                          SizedBox(width: 5),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MajorTitle(
                                title: "Dr .Tonia",
                                color: Colors.black,
                                size: 16,
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              MinorTitle(title: "Neurology", color: Colors.grey),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  MinorTitle(
                                    title: "Video",
                                    color: Colors.grey,
                                    size: 14,
                                  ),
                                  SizedBox(width: 3),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 3),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                            width: 1, color: Styles.mainColor)),
                                    child: MinorTitle(
                                      title: type,
                                      color: Styles.mainColor,
                                      size: 14,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                      if (type.toString().toLowerCase() != "cancelled")
                        InkWell(
                          onTap: () {
                            showOperationsBottomSheet(
                                type: type, context: context);
                          },
                          child: Icon(
                            Icons.more_vert,
                            color: Colors.black,
                          ),
                        )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.calendar_today_outlined,
                            size: 15,
                          ),
                          SizedBox(width: 3),
                          MinorTitle(
                            title:
                                "${DateFormat("dd MMM yyyy").format(DateTime.now())}",
                            color: Colors.grey,
                            size: 14,
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.watch_later_outlined,
                            size: 15,
                          ),
                          SizedBox(width: 3),
                          MinorTitle(
                            title:
                                "${DateFormat("hh:mm a").format(DateTime.now())}-${DateFormat("hh:mm a").format(DateTime.now())}",
                            color: Colors.grey,
                            size: 14,
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }

  showOperationsBottomSheet({required type, required BuildContext context}) {
    return showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
        ),
        context: context,
        builder: (context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return DraggableScrollableSheet(
                initialChildSize: 0.35,
                expand: false,
                builder:
                    (BuildContext context, ScrollController scrollController) {
                  return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.008,
                            width: MediaQuery.of(context).size.width * 0.2,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        if (type.toString().toLowerCase() == "upcoming")
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ListTile(
                                onTap: () {
                                  Get.back();
                                  Get.to(() => ResheduleCancelAppointment(
                                      title: "Reshedule"));
                                },
                                leading: Icon(
                                  Icons.settings,
                                  color: Colors.black,
                                ),
                                title: MinorTitle(
                                    title: "Reshedule", color: Colors.grey),
                              ),
                              ListTile(
                                onTap: () {
                                  Get.back();
                                  Get.to(() => ResheduleCancelAppointment(
                                      title: "Cancel"));
                                },
                                leading: Icon(
                                  Icons.location_on,
                                  color: Colors.black,
                                ),
                                title: MinorTitle(
                                    title: "Cancel Appointment",
                                    color: Colors.grey),
                              ),
                            ],
                          ),
                        if (type.toString().toLowerCase() == "completed")
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ListTile(
                                onTap: () {
                                  Get.back();
                                },
                                leading: Icon(
                                  Icons.bookmark,
                                  color: Colors.black,
                                ),
                                title: MinorTitle(
                                    title: "Book again", color: Colors.grey),
                              ),
                              ListTile(
                                onTap: () {
                                  Get.back();
                                  Get.to(() => DoctorReview());
                                },
                                leading: Icon(
                                  Icons.reviews_rounded,
                                  color: Colors.black,
                                ),
                                title: MinorTitle(
                                    title: "Leave a review",
                                    color: Colors.grey),
                              ),
                            ],
                          )
                      ],
                    ),
                  );
                });
          });
        });
  }
}
