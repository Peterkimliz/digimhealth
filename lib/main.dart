import 'package:digimhealth/bindings.dart';
import 'package:digimhealth/controllers/UserController.dart';
import 'package:digimhealth/controllers/appointment_controler.dart';
import 'package:digimhealth/controllers/authController.dart';
import 'package:digimhealth/controllers/home_controller.dart';
import 'package:digimhealth/screens/auth/handle_authpage.dart';
import 'package:digimhealth/screens/onboard/onboardScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AuthController authController = Get.put<AuthController>(AuthController());

  AppointmentController appointmentController =
      Get.put<AppointmentController>(AppointmentController());

  UserController userController = Get.put<UserController>(UserController());

  HomeController homeController = Get.put<HomeController>(HomeController()
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          appBarTheme:
              AppBarTheme(backgroundColor: Colors.white, elevation: 0.0)),
      title: "DigiMHealth",
      home:HandleAuthPage() ,
      initialBinding: AppBindings(),
    );
  }
}
