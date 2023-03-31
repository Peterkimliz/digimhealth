import 'package:digimhealth/controllers/appointment_controler.dart';
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
          backButton(icon: Icons.add),
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
                Tab(text: "Previous"),
              ],
            ),
          ),
          Expanded(
              child: TabBarView(
            controller: appointmentController.tabController,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              Apointments(),
              Apointments(),
            ],
          ))
        ],
      ),
    );
  }
}

class Apointments extends StatelessWidget {
  const Apointments({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Container(
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
                          height: 50,
                          width: 50,
                          margin: EdgeInsets.only(right: 5),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image:
                                      AssetImage("assets/images/doctor4.jpg"),
                                  fit: BoxFit.cover)),
                        ),
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
                          ],
                        ),
                      ],
                    ),
                    Icon(
                      Icons.more_vert,
                      color: Colors.black,
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.calendar_today_outlined,size: 15,),
                        SizedBox(width: 3),
                        MinorTitle(title: "${DateFormat("dd MMM yyyy").format(DateTime.now())}", color: Colors.grey,size: 14,),
                      ],
                    ),Row(
                      children: [
                        Icon(Icons.watch_later_outlined,size: 15,),
                        SizedBox(width: 3),
                        MinorTitle(title: "${DateFormat("hh:mm a").format(DateTime.now())}-${DateFormat("hh:mm a").format(DateTime.now())}", color: Colors.grey,size: 14,),
                      ],
                    ),Row(
                      children: [
                        Icon(Icons.video_call,size: 15,),
                        SizedBox(width: 3),
                        MinorTitle(title: "Video", color: Colors.grey,size: 14,),
                      ],
                    )
                  ],
                )
              ],
            ),
          );
        });
  }
}
