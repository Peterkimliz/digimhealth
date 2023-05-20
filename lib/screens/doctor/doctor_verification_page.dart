import 'package:digimhealth/widgets/major_title.dart';
import 'package:flutter/material.dart';

class DoctorVerificationPage extends StatelessWidget {
  const DoctorVerificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                "assets/images/successAccount.png",
                width: 100,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 5),
            Center(
              child: MajorTitle(
                title: "Account Successfully created",
                color: Colors.black,
                size: 18,
              ),
            ),
            SizedBox(height: 5),
            Center(
              child: Text(
                "It will take one to two working business days for your account to be approved",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
