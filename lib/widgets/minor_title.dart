import 'package:flutter/material.dart';

class MinorTitle extends StatelessWidget {
  final String title;
  double? size=15.0;
  final Color color;
  final FontWeight ?fontWeight;
  int ? maxline=1;

  MinorTitle({Key? key, required this.title, required this.color,this.size,this.fontWeight,this.maxline}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(title,
      maxLines: maxline,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: fontWeight,
        fontFamily: "RobotoLight",
        overflow: TextOverflow.ellipsis,

      ),
    );
  }
}
