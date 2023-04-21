import 'package:flutter/material.dart';

import '../../../utils/styles.dart';
import '../../../widgets/minor_title.dart';

Widget reviewsCard(){
  return  Container(
    margin: EdgeInsets.only(bottom: 5),
    padding: EdgeInsets.all(3),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              height: 50,
              width: 50,
              margin: EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image:
                      AssetImage("assets/images/doctor4.jpg"),
                      fit: BoxFit.cover)),
            ),
            SizedBox(width: 10),
            MinorTitle(
              title: "Peter James",
              color: Colors.black,
              size: 17,
            ),
          Spacer(),
            Container(
              padding:
              EdgeInsets.symmetric(horizontal: 15, vertical: 3),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                      color: Styles.mainColor, width: 1)),
              child: Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Styles.mainColor,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: MinorTitle(
                      title: "5",
                      color: Styles.mainColor,
                      size: 18,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
        SizedBox(height: 5,),
        Text(
            "Lorem ipsum dolor sit amet consectetur. Nulla integer viverra non hendrerit facilisis accumsan praesent proin pharetra")
      ],
    ),
  );
}