import 'package:digimhealth/bindings.dart';
import 'package:digimhealth/controllers/UserController.dart';
import 'package:digimhealth/controllers/appointment_controler.dart';
import 'package:digimhealth/controllers/authController.dart';
import 'package:digimhealth/controllers/home_controller.dart';
import 'package:digimhealth/screens/auth/handle_authpage.dart';
import 'package:digimhealth/utils/constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

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

  HomeController homeController = Get.put<HomeController>(HomeController());

  @override
  void initState() {
    initOneSignal();
    oneSignalObservers();
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
      home: HandleAuthPage(),
      initialBinding: AppBindings(),
    );
  }

  initOneSignal() {
    OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);
    OneSignal.shared.setAppId(ONE_SIGNAL_KEY);
    OneSignal.shared.promptUserForPushNotificationPermission().then((value) {});
  }

  oneSignalObservers() {
    OneSignal.shared.setNotificationWillShowInForegroundHandler((event) {
      event.complete(event.notification);
    });
    OneSignal.shared.setNotificationOpenedHandler((openedResult) {});
  }
}
