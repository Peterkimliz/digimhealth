import 'package:flutter/material.dart';

class MajorTitle extends StatelessWidget {
  final String title;
   double? size=18.0;
  final Color color;

  MajorTitle({Key? key, required this.title, required this.color,this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(title,
      maxLines: 1,
      style: TextStyle(
        color: color,
        fontWeight: FontWeight.bold,
        fontSize: size,
        overflow: TextOverflow.ellipsis,

      ),
    );
  }
}
