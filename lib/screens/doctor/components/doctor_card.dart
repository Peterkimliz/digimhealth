import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../models/user_model.dart';
import '../../../widgets/image_loader.dart';
import '../../../widgets/major_title.dart';
import '../../../widgets/minor_title.dart';

Widget doctorCard({required UserModel userModel, bool? isVisible = true}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      userModel.profileImage == null
          ? ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                "assets/images/profile.png",
                height:  80,
                width:80,
                fit: BoxFit.fill,
              ),
            )
          : CachedNetworkImage(
              imageUrl: "${userModel.profileImage}",
              imageBuilder: (context, imageProvider) => ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.fill,
                        ),
                      ))),
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  imageLoader(width:  80, height: 80.0),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
  SizedBox(width: 5),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MajorTitle(
              title: "Dr .${userModel.username}",
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
