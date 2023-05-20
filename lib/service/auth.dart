import 'dart:convert';

import 'package:digimhealth/service/api_urls.dart';
import 'package:digimhealth/service/client.dart';

class Auth {
  createUser({required Map<String, dynamic> body}) async {
    var response =
        await DbBase().database(signup, DbBase().postRequest, body: body);
    return jsonDecode(response);
  }



  loginUser({required Map<String, dynamic> body}) async {
    var response =
        await DbBase().database(signin, DbBase().postRequest, body: body);
    return jsonDecode(response);
  }
}
