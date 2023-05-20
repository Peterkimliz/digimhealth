
import 'package:flutter/material.dart';

class BackGroundImage extends StatelessWidget {
  const BackGroundImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ShaderMask(
      blendMode: BlendMode.darken,
      shaderCallback: (value) => LinearGradient(
          colors: [Colors.black, Colors.black12],
          begin: Alignment.bottomCenter,
          end: Alignment.center
      ).createShader(value),
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/doctor1.jpg"),
                colorFilter:
                ColorFilter.mode(Colors.black45, BlendMode.darken))),
      ),
    );
  }
}
