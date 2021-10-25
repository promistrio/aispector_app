import 'package:airspector/pages/missions/run_mission_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../bloc/mission_manager.dart';
import 'edit_stage_page.dart';

class MissionPage extends StatelessWidget {
  const MissionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //MissionManager missionManager = Provider.of<MissionManager>(context);
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
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => RunMissionPage()));
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
              builder: (context) =>
                  EditStagePage(
                    stageId: mm.stages.length - 1,
                  )));
          },
        );
      }),
    );
  }
}
