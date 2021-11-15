import 'package:airspector/pages/missions/run_mission_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:airspector/business_logic/providers/mission_provider.dart';
import 'edit_stage_page.dart';

class MissionPage extends StatelessWidget {
  const MissionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Mission'),
        actions: <Widget>[
          Consumer<MissionProvider>(builder: (context, mm, child) {
            return TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 14, color: Colors.white),
                primary: Colors.white,
              ),
              onPressed: () {
                mm.missionController.generateMission();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => RunMissionPage(
                          stages: mm.missionController.stagesModel,
                        )));
              },
              child: const Text('Start'),
            );
          })
        ],
      ),
      body: Consumer<MissionProvider>(
        builder: (context, mm, child) {
          return ListView(
            padding: const EdgeInsets.all(8),
            children: List.generate(
              mm.missionController.stages.length,
              (i) => ListTile(
                leading: const Icon(
                  Icons.flight,
                  color: Colors.black,
                ),
                title: Text(
                    "Stage ${i + 1} ${mm.missionController.stages[i].start_z.toString()} - ${mm.missionController.stages[i].stop_z.toString()} ${mm.missionController.stages[i].pitch.toString()}deg"), //"5-20 m 90 deg"*/
                onTap: () {
                  mm.updateFormValue(i);
                  _navigateEditStage(context, i);
                },
              ),
            ),
          );
        },
      ),
      floatingActionButton:
          Consumer<MissionProvider>(builder: (context, mm, child) {
        return FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            _navigateAddStage(context, mm);
          },
        );
      }),
    );
  }

  void _navigateAddStage(BuildContext context, MissionProvider mm) async {
    // Navigator.push returns a Future that completes after calling
    // Navigator.pop on the Selection Screen.
    mm.updateFormValue(mm.addStage());
    _navigateEditStage(context, mm.missionController.getLastStageId());
  }

  void _navigateEditStage(BuildContext context, int idStage) async {
    String stageStatus = await Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => EditStagePage(
              stageId: idStage,
            )));

    // After the Selection Screen returns a result, hide any previous snackbars
    // and show the new result.
    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(stageStatus)));
  }
}
