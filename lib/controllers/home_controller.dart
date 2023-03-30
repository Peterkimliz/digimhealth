import 'package:digimhealth/screens/home/blog_page.dart';
import 'package:digimhealth/screens/home/home_page.dart';
import 'package:digimhealth/screens/home/message_page.dart';
import 'package:digimhealth/screens/home/notification_page.dart';
import 'package:digimhealth/screens/home/profile_page.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxInt selectedPage = RxInt(0);
  List pages = [
    HomePage(),
    BlogPage(),
    NotificationPage(),
    ChatPage(),
    ProfilePage()
  ];
}
