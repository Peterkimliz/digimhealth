import 'package:digimhealth/controllers/authController.dart';
import 'package:digimhealth/controllers/home_controller.dart';
import 'package:get/get.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<AuthController>(AuthController(), permanent: true);
    Get.put<HomeController>(HomeController(), permanent: true);
  }
}
