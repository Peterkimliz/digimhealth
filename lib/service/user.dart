import 'dart:convert';

import 'package:digimhealth/service/api_urls.dart';
import 'package:digimhealth/service/client.dart';

class User {
  updateUser({required Map<String, dynamic> body,required uid}) async {
    var response =
        await DbBase().database("${user}/$uid", DbBase().putRequest, body: body);
    return jsonDecode(response);
  }
  getUserById({required uid}) async {
    var response = await DbBase().database("${user}/$uid", DbBase().getRequest);
    return jsonDecode(response);
  }
}
