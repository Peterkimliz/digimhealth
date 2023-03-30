import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/styles.dart';

Widget onBoardWidget({required context,required image, required title,required description}){
  return  Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        height: MediaQuery.of(context).size.height*0.6 ,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage( image,)
            )
        ),
      ),

      Center(
        child: Text(
          title,
          style: TextStyle(
              color: Styles.mainColor,
              fontSize: 35,
              letterSpacing: 1,
              wordSpacing: 2,
              fontWeight: FontWeight.bold),
        ),
      ),
      SizedBox(height: 10),
      Center(
        child: Text(
          description,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.black54,
              fontSize: 18,
              fontWeight: FontWeight.w500),
        ),
      ),
      Spacer(),
    ],
  );
}