import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Widget imageLoader({required width,required height}){
  return   SizedBox(
    width: width,
    height:height,
    child: Shimmer.fromColors(
      baseColor: Colors.grey.withOpacity(0.2),
      highlightColor: Colors.grey.withOpacity(0.2),
      child: Container(
        width: width,
        height:height,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius:
          BorderRadius.circular(15),
        ),
      ),
    ),
  );
}