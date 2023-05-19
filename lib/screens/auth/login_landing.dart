import 'package:digimhealth/controllers/authController.dart';
import 'package:digimhealth/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginLanding extends StatelessWidget {
   LoginLanding({Key? key}) : super(key: key);
AuthController authController=Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Styles.mainColor.withOpacity(0.1),
                  Colors.white,
                ],
                begin: const FractionalOffset(0.0, 1.0),
                end: const FractionalOffset(1.0, 0.0),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.4,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    )),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Spacer(),
                      Image.asset("assets/images/log.png"),
                      Spacer(),
                      TabBar(
                        labelColor:Styles.mainColor,
                        unselectedLabelColor: Styles.mainColor,
                        indicatorPadding: EdgeInsets.symmetric(horizontal: 30),
                        indicatorWeight: 3,
                        indicatorColor: Styles.mainColor,
                        labelStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                        controller: authController.tabController, tabs: [
                        Tab(text: "Patient" ),
                        Tab(text: "Specialist" )



                      ])
                    ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
