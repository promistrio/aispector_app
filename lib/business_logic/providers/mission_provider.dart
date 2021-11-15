import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
//import 'dart:convert';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:airspector/business_logic/models/stages.dart';
import 'package:airspector/business_logic/controllers/mission_edit_controller.dart';

class MissionProvider with ChangeNotifier, DiagnosticableTreeMixin {
  MissionEditController missionController;

  // add stage to end and return id
  int addStage() {
    missionController.pushStage(Stage(0, 0, 0, 0));
    notifyListeners();
    return missionController.getLastStageId();
  }

  /*get form => missionController.form;
  set form(FormGroup form) => missionController.form = form;*/

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
