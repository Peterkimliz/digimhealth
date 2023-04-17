import 'package:flutter/material.dart';

import '../../../widgets/major_title.dart';
import '../../../widgets/minor_title.dart';

Widget doctorCard({bool? isVisible=true}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        height: 80,
        width: 80,
        margin: EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
                image: AssetImage("assets/images/doctor4.jpg"),
                fit: BoxFit.cover)),
      ),
      Expanded(
        child: Column(
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
              height: 15,
            ),
            if (isVisible!)
              Row(
              children: [
                Icon(Icons.star, color: Colors.yellow, size: 18),
                SizedBox(width: 5),

                Row(
                  children: [
                    MinorTitle(title: "4.8", color: Colors.black),
                    SizedBox(width: 5),
                    MinorTitle(title: "(110 Reviews)", color: Colors.grey),
                  ],
                ),
              ],
            ),
            if (!isVisible)
              MinorTitle(title: "St Luis ,United States", color: Colors.black),
          ],
        ),
      ),
    ],
  );
}
