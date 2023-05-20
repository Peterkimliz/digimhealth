import 'dart:convert';

import 'package:digimhealth/service/api_urls.dart';
import 'package:digimhealth/service/client.dart';

class User {
  updateUser({required Map<String, dynamic> body, required uid}) async {
    var response = await DbBase()
        .database("${user}/$uid", DbBase().putRequest, body: body);
    return jsonDecode(response);
  }

  getUserById({required uid}) async {
    var response = await DbBase().database("${user}/$uid", DbBase().getRequest);
    return json.decode(response);
  }

  updateDoctorDetails(
      {required Map<String, dynamic> body, required uid}) async {
    var response = await DbBase()
        .database("${doctor}/update/$uid", DbBase().putRequest, body: body);
    return json.decode(response);
  }

  searchDoctorDetails(
      {required category, required pageNumber, required name}) async {
    var response = await DbBase().database(
        "${doctor}/search?category=${category}&pageNumber=${pageNumber}&name=${name}",
        DbBase().getRequest);
    return json.decode(response);
  }
}
