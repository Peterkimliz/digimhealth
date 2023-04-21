import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class DbBase {
  var postRequest = "POST";
  var getRequest = "GET";
  var deleteRequest = "DELETE";
  var patchRequest = "PATCH";
  var putRequest = "PUT";

  database(String link, String method,
      {Map<String, String>? headers, Map<String, dynamic>? body}) async {
    try {
      if (headers == null) {
        SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        String? token = sharedPreferences.getString("accessToken");
        headers = {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${token ?? ""}"
        };
      }
      var request = http.Request(method, Uri.parse(link));
      if (body != null) {
        request.body = json.encode(body);
      }
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();
      return response.stream.bytesToString();
    } catch (e) {
      print(e);
    }
  }
}
