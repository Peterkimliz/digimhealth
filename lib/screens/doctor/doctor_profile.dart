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
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 80,
                    width: 80,
                    margin: EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: AssetImage(
                                "assets/images/doctor4.jpg"),
                            fit: BoxFit.cover)),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        MajorTitle(
                          title: "Dr .Tonia",
                          color: Colors.black,
                          size: 16,
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        MinorTitle(
                            title: "Neurology",
                            color: Colors.grey),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Icon(Icons.star,
                                color: Colors.yellow, size: 18),
                            SizedBox(width: 5),
                            Row(
                              children: [
                                MinorTitle(
                                    title: "4.8",
                                    color: Colors.black),
                                SizedBox(width: 5),
                                MinorTitle(
                                    title: "(110 Reviews)",
                                    color: Colors.grey),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),


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
