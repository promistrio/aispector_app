import 'dart:convert';

import 'package:airspector/pages/missions/run_mission_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:airspector/business_logic/providers/mission_provider.dart';
import 'edit_stage_page.dart';

import 'package:file_picker/file_picker.dart';
import 'dart:io';
// ...

class MissionFromFilePage extends StatelessWidget {
  const MissionFromFilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ElevatedButton(
            onPressed: () async {
              FilePickerResult? missionFile =
                  await FilePicker.platform.pickFiles();

              // if user has been select file
              if (missionFile != null) {
                File file = File(missionFile.files.single.path ?? "");
                parseMission(file.readAsStringSync());
              } else {
                // User canceled the picker
              }
            },
            child: const Text("Открыть файл маршрута"))
      ],
    ));
  }

  parseMission(String data) {
    Map<String, dynamic> outputMission = {};
    Map<String, dynamic> mission = jsonDecode(data);
    int counter = 1;
    double pitch = 0;
    double yaw = 0;

    if (mission.containsKey("mission")) {
      List<dynamic> missionItems = mission["mission"]["items"];
      for (Map<String, dynamic> item in missionItems) {
        if (item.containsKey("command")) {
          if (item["command"] == 205) {
            pitch = item['params'][0];
          }
          if (item["command"] == 16) {
            double lat = item["params"][4];
            double lon = item["params"][5];
            double alt = item["params"][6].toDouble();
            outputMission[counter.toString()] = {
              "cmd_drone": 16,
              "x": 0,
              "y": 0,
              "z": alt,
              "lat": lat,
              "lon": lon,
              "cmd_cam": 203,
              "yaw": yaw,
              "pitch": pitch
            };
            counter++;
          }
        }
        if (item.containsKey("TransectStyleComplexItem")) {
          dynamic routeItems = item['TransectStyleComplexItem']['Items'];
          for (dynamic rItem in routeItems) {
            if (rItem['command'] == 16) {
              dynamic ln = {};
              double lat = rItem['params'][4];
              double lon = rItem['params'][5];
              double alt = rItem['params'][6];
              int cmd_drone = 16;
              outputMission[counter.toString()] = {
                "cmd_drone": 16,
                "x": 0,
                "y": 0,
                "z": alt,
                "lat": lat,
                "lon": lon,
                "cmd_cam": 203,
                "yaw": yaw,
                "pitch": pitch
              };
              counter++;
            }
          }
        }
      }
      print(jsonEncode(outputMission));
    }
  }
}
