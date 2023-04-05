import 'package:digimhealth/screens/doctor/components/doctor_card.dart';
import 'package:digimhealth/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/major_title.dart';
import '../../widgets/minor_title.dart';
import '../appointments/book_appointment.dart';

class DoctorProfile  extends StatelessWidget {
  const DoctorProfile ({Key? key}) : super(key: key);
  //practice licence

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.2,
        title: MajorTitle(title: "Doctor", color: Colors.black),
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal:10.0),
          child: Column(
            children: [
              doctorCard(),


            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10,horizontal: 5),
          height: kBottomNavigationBarHeight,
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Styles.mainColor.withOpacity(0.1)
                      ,borderRadius: BorderRadius.circular(10)
                ),
                child: Icon(Icons.favorite,color: Styles.mainColor,),

              ),
              SizedBox(width: 10),
              Expanded(
                child: InkWell(
                  onTap: () {
                    Get.to(() => BookAppointment());
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Styles.mainColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: MajorTitle(
                        title: "Book Now",
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
