import 'package:airspector/pages/missions/run_mission_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../bloc/mission_manager.dart';
import 'edit_stage_page.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MissionPage extends StatelessWidget {
  const MissionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Mission'),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 14, color: Colors.white),
              primary: Colors.white,
            ),
            onPressed: () {
              var url = Uri.parse(
                  'https://g3n50ajpa9.execute-api.eu-central-1.amazonaws.com/default/mission_planner');
              http
                  .post(url,
                      body: json.encode(<String, dynamic>{
                        "output": 0,
                        "isSkydio": true,
                        "isMultiMission": true,
                        "requests": [
                          {
                            "alpha": 84.0,
                            "theta": 56.0,
                            "overlap_h": 70.0,
                            "overlap_v": 70.0,
                            "pitch": 0.0,
                            "R": 1,
                            "H": 40,
                            "r": 2.0,
                            "obj_cx": 0,
                            "obj_cy": 0,
                            "obj_cz": 0.0,
                            "type": 1,
                            "home_cy": 0,
                            "home_cx": 0,
                            "start_z": 0.0,
                            "stop_z": 20,
                            "cam_edge": true,
                            "fence_enabled": false,
                            "fence_offset": null,
                          }
                        ]
                      }))
                  .then((response) {
                dynamic map = json.decode(response.body);
                print(map["1"]);
                //print(json.decode(json.decode(response.body)));
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const RunMissionPage()));
              });
            },
            child: const Text('Start'),
          ),
        ],
      ),
      body: Consumer<MissionManager>(
        builder: (context, mm, child) {
          return ListView(
            padding: const EdgeInsets.all(8),
            children: List.generate(
              mm.stages.length,
              (i) => ListTile(
                leading: const Icon(
                  Icons.flight,
                  color: Colors.black,
                ),
                title: Text(
                    "Stage ${i + 1} ${mm.stages[i]['start_z'].toString()} - ${mm.stages[i]['stop_z'].toString()} ${mm.stages[i]['pitch'].toString()}deg"), //"5-20 m 90 deg"
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => EditStagePage(
                            stageId: i,
                          )));
                },
              ),
            ),
          );
        },
      ),
      floatingActionButton:
          Consumer<MissionManager>(builder: (context, mm, child) {
        return FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            mm.updateFormValue(mm.addStage());
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => EditStagePage(
                      stageId: mm.stages.length - 1,
                    )));
          },
        );
      }),
    );
  }
}
