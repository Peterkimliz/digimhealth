import 'dart:math';

import 'package:flutter/material.dart';

class Loader extends StatefulWidget {
  const Loader({Key? key}) : super(key: key);

  @override
  _LoaderState createState() => _LoaderState();
}

class _LoaderState extends State<Loader> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation_rotation;
  late Animation<double> animation_radius_in;
  late Animation<double> animation_radius_out;
  final double initialRadius = 30.0;
  double radius = 0.0;

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 5));
    animation_radius_in = Tween<double>(begin: 1.0, end: 0.0).animate(
        CurvedAnimation(
            parent: animationController,
            curve: Interval(0.75, 1.0, curve: Curves.elasticIn)));
    animation_rotation=Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: animationController,
            curve: Interval(0.0, 1.0, curve: Curves.linear)));
    animation_radius_out = Tween<double>(begin: 0.75, end: 1.0).animate(
        CurvedAnimation(
            parent: animationController,
            curve: Interval(0.0, 0.25, curve: Curves.elasticIn)));
    animationController.addListener(() {
      setState(() {
        if (animationController.value >= 0.75 &&
            animationController.value <= 1.0) {
          radius = animation_radius_in.value * initialRadius;
        } else if (animationController.value >= 0.0 &&
            animationController.value <= 0.25) {
          radius = animation_radius_out.value * initialRadius;
        }
      });
    });
    animationController.repeat();
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      child: Center(
        child: RotationTransition(
          turns: animation_rotation,
          child: Stack(
            children: [
              Dot(radius: 30.0, color: Colors.black12),
              Transform.translate(
                  offset: Offset(cos(pi / 4) * radius, radius * sin(pi / 4)),
                  child: Dot(radius: 9.0, color: Colors.redAccent)),
              Transform.translate(
                  offset:
                      Offset(cos(2 * pi / 4) * radius, radius * sin(2 * pi / 4)),
                  child: Dot(radius: 9.0, color: Colors.greenAccent)),
              Transform.translate(
                  offset:
                      Offset(cos(3 * pi / 4) * radius, radius * sin(3 * pi / 4)),
                  child: Dot(radius: 9.0, color: Colors.blueAccent)),
              Transform.translate(
                  offset:
                      Offset(cos(4 * pi / 4) * radius, radius * sin(4 * pi / 4)),
                  child: Dot(radius: 9.0, color: Colors.purple)),
              Transform.translate(
                  offset:
                      Offset(cos(5 * pi / 4) * radius, radius * sin(5 * pi / 4)),
                  child: Dot(radius: 9.0, color: Colors.amberAccent)),
              Transform.translate(
                  offset:
                      Offset(cos(6 * pi / 4) * radius, radius * sin(6 * pi / 4)),
                  child: Dot(radius: 9.0, color: Colors.blue)),
              Transform.translate(
                  offset:
                      Offset(cos(7 * pi / 4) * radius, radius * sin(7 * pi / 4)),
                  child: Dot(radius: 9.0, color: Colors.orangeAccent)),
              Transform.translate(
                  offset:
                      Offset(cos(8 * pi / 4) * radius, radius * sin(8 * pi / 4)),
                  child: Dot(radius: 9.0, color: Colors.lightGreenAccent)),
            ],
          ),
        ),
      ),
    );
  }
}

class Dot extends StatelessWidget {
  final radius;
  final Color color;

  const Dot({Key? key, required this.radius, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: radius,
        width: radius,
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      ),
    );
  }
}
