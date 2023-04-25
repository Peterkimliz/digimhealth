import 'package:digimhealth/models/category_model.dart';
import 'package:digimhealth/screens/chats/message_page.dart';
import 'package:digimhealth/screens/home/appointments_page.dart';
import 'package:digimhealth/screens/home/blog_page.dart';
import 'package:digimhealth/screens/home/home_page.dart';
import 'package:digimhealth/screens/profile/profile_page.dart';
import 'package:digimhealth/service/category.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxInt selectedPage = RxInt(0);
  RxList<CategoryModel> categories = RxList([]);
  RxBool loadingCategories = RxBool(false);
  List pages = [
    HomePage(),
    BlogPage(),
    AppointmentsPage(),
    ChatPage(),
    ProfilePage()
  ];

  callinit() {
    getCategories();
  }

  getCategories() async {
    try {
      loadingCategories.value = true;
      var response = await Category().getCategories();
      print(response);
      if (response != null) {
        List rawData = response;

        List<CategoryModel> categoriesData= rawData.map((e) => CategoryModel.fromJson(e)).toList();
        categories.assignAll(categoriesData);
        print("length is${categories.length}");
      } else {
        categories.value = [];
      }

      loadingCategories.value = false;
    } catch (e) {
      loadingCategories.value = false;
      print(e);
    }
  }
}
