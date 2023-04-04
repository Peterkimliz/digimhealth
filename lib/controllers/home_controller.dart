import 'package:digimhealth/screens/home/blog_page.dart';
import 'package:digimhealth/screens/home/home_page.dart';
import 'package:digimhealth/screens/home/message_page.dart';
import 'package:digimhealth/screens/home/appointments_page.dart';
import 'package:digimhealth/screens/profile/profile_page.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxInt selectedPage = RxInt(0);
  List pages = [
    HomePage(),
    BlogPage(),
    AppointmentsPage(),
    ChatPage(),
    ProfilePage()
  ];
}
