import 'dart:convert';

import 'package:airspector/business_logic/models/stages.dart';
import 'package:http/http.dart' as http;
import 'package:airspector/business_logic/models/points.dart';

class UserApiController {
  bool authorize(String email, String password) {
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
    };
    Map<String, String> mBody = {
      "email": "mts@yandex.ru",
      "password": "123456"
    };
    String sBody = jsonEncode(mBody);
    final response = http
        .post(
      Uri.parse(
          'https://g3n50ajpa9.execute-api.eu-central-1.amazonaws.com/default/mission_planner'),
      headers: headers,
      body: sBody,
    )
        .then((response) {
      if (response.statusCode == 200) {
        return WayPoints(jsonDecode(response.body)["route-meta"]["points"]);
      } else {
        // If the server did not return a 201 CREATED response,
        // then throw an exception.
        throw Exception('Failed to generate mission.');
      }
    });

    return false;
  }
}
