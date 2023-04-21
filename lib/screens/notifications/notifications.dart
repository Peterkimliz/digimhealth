import 'package:digimhealth/utils/styles.dart';
import 'package:digimhealth/widgets/back_button.dart';
import 'package:digimhealth/widgets/major_title.dart';
import 'package:digimhealth/widgets/minor_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class Notifications extends StatelessWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: commonWidget(
            icon: Icons.arrow_back,
            onPressed: () {
              Get.back();
            }),
        title: MajorTitle(title: "Notifications", color: Colors.black),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Styles.mainColor.withOpacity(0.2),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Icon(
                          Icons.calendar_today_outlined,
                          color: Styles.mainColor,
                        ),
                      ),
                    ),
                    SizedBox(width: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MajorTitle(
                            title: "Appointment Cancelled!",
                            color: Colors.black),
                        SizedBox(height: 5),
                        IntrinsicHeight(
                          child: Row(
                            children: [
                              MinorTitle(title: "Today", color: Colors.grey),
                              SizedBox(
                                width: 3,
                              ),
                              VerticalDivider(
                                color: Colors.grey,
                                thickness: 1,
                              ),
                              SizedBox(
                                width: 3,
                              ),
                              MinorTitle(title: "5:00pm", color: Colors.grey),
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(height: 10),
                Text("You have successfully cancelled your appointment with Dr.Peter lojis on ${DateFormat("MMMM dd,yyyy").format(DateTime.now())}"),
                SizedBox(height: 5),
                Divider(),
              ],
            ),
          );
        },
        itemCount: 20,
        shrinkWrap: true,
      ),
    );
  }
}
