import 'dart:convert';

import 'package:digimhealth/service/api_urls.dart';
import 'package:digimhealth/service/client.dart';

class Category{

  getCategories() async {
    var response=await DbBase().database(category, DbBase().getRequest);
    return jsonDecode(response);
  }


}