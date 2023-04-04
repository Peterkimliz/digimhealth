import 'package:flutter/material.dart';

import 'major_title.dart';
import 'minor_title.dart';

Widget clinicCard(context) {
  return Container(
    width: MediaQuery.of(context).size.width * 0.7,
    margin: EdgeInsets.all(10),
    decoration: BoxDecoration(color: Colors.white, boxShadow: [
      BoxShadow(blurRadius: 1, offset: Offset(1, 1), color: Colors.grey)
    ]),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 110,
          width: 300,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              image: DecorationImage(
                  image: AssetImage("assets/images/doctor1.jpg"),
                  fit: BoxFit.fill)),
        ),
        SizedBox(height: 5),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MajorTitle(
              title: "Maan Clinic Ltd",
              color: Colors.black,
              size: 17,
            ),
            SizedBox(height: 5),
            Row(children: [
              Icon(
                Icons.location_on_outlined,
                color: Colors.grey,
              ),
              MinorTitle(title: "Dakar India", color: Colors.grey),
            ]),
            SizedBox(height: 5),
            Row(children: [
              Icon(
                Icons.star,
                color: Colors.yellow,
              ),
              SizedBox(width: 5),
              MinorTitle(title: "4.5", color: Colors.black),
              MinorTitle(title: " (70+)", color: Colors.grey),
            ])
          ],
        ),
      ],
    ),
  );
}
