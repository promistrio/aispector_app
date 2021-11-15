import 'dart:convert';

import 'package:airspector/business_logic/models/stages.dart';
import 'package:http/http.dart' as http;

class MissionApiController {
  Future<Stages> requestGeneratedMission(Stages stages) async {
    print("hello");
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
    };
    String body = jsonEncode(stages.toJson());
    print(body);
    final response = await http.post(
      Uri.parse(
          'https://g3n50ajpa9.execute-api.eu-central-1.amazonaws.com/default/mission_planner'),
      headers: headers,
      body: body,
    );

    if (response.statusCode == 200) {
      print(response.body);
      return Stages([]);
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to generate mission.');
    }
  }

  void generateMissionFromRest(Stages data) {
    requestGeneratedMission(data);
  }

  /*Stages getFakeStages(){

    return 
  }*/
}
