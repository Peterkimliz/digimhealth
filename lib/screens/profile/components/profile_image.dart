import 'package:flutter/material.dart';

import '../../../utils/styles.dart';

Widget profileImage() {
  return Center(
    child: Stack(
      clipBehavior: Clip.antiAlias,
      children: [
        CircleAvatar(
          radius: 60,
          backgroundImage: AssetImage(
            "assets/images/profile.png",
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: CircleAvatar(
            backgroundColor: Styles.mainColor,
            child: Center(
              child: Icon(
                Icons.camera_alt_outlined,
                color: Colors.white,
              ),
            ),
          ),
        )
      ],
    ),
  );
}
