import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
//import 'dart:convert';
import 'package:reactive_forms/reactive_forms.dart';
// Models
import 'package:airspector/business_logic/models/stages.dart';
import 'package:airspector/business_logic/models/points.dart';
import 'package:airspector/business_logic/controllers/mission_edit_controller.dart';

class MissionProvider with ChangeNotifier, DiagnosticableTreeMixin {
  MissionEditController missionController;

  Future<WayPoints> get waypoints => missionController.waypoinsFromApi;

  // add stage to end and return id
  int addStage() {
    missionController.pushStage(Stage(1, 3, 20, 30));
    notifyListeners();
    return missionController.getLastStageId();
  }

  void updateFormValue(int i) {
    missionController.updateFormValue(i);
    notifyListeners();
  }

  void writeFormToStage(int i) {
    missionController.writeFormToStage(i);
    notifyListeners();
  }

  void deleteStage(int i) {
    missionController.deleteStage(i);
    notifyListeners();
  }

  MissionProvider({required this.missionController}) {
    /**/
  }
}
