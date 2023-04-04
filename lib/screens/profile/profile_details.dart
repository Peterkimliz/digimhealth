import 'package:digimhealth/utils/styles.dart';
import 'package:digimhealth/widgets/back_button.dart';
import 'package:digimhealth/widgets/major_title.dart';
import 'package:flutter/material.dart';

import '../../widgets/minor_title.dart';

class ProfileDetails extends StatelessWidget {
  const ProfileDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: backButton(icon: Icons.arrow_back),
        title: MajorTitle(title: "Profile", color: Colors.black),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.edit,
                color: Styles.mainColor,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    margin: EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                            image: AssetImage("assets/images/doctor4.jpg"),
                            fit: BoxFit.cover)),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MajorTitle(
                        title: "Peter Lojis",
                        color: Colors.black,
                        size: 16,
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      MinorTitle(title: "0782015660", color: Colors.grey),
                      SizedBox(
                        height: 2,
                      ),
                      MinorTitle(
                          title: "peterlojis@gmail.com", color: Colors.grey),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 30),
              MajorTitle(title: "Pesonal Details", color: Colors.black),
              SizedBox(height: 10),
              textFields(),
              SizedBox(height: 10),
              textFields(),
              SizedBox(height: 10),
              textFields(),
              SizedBox(height: 10),
              textFields()
            ],
          ),
        ),
      ),
    );
  }

  Widget textFields() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: TextFormField(
        enabled: false,
        decoration: InputDecoration(
            hintText: "Peter",
            labelText: "Full Name",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey, width: 1),
            ),
            labelStyle: TextStyle(color: Colors.black),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey, width: 1),
            )),
      ),
    );
  }
}
