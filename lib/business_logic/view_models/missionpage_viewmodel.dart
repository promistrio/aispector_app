import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
//import 'dart:convert';
import 'package:reactive_forms/reactive_forms.dart';

class MissionPageViewModel with ChangeNotifier, DiagnosticableTreeMixin {
  List<Map<String, dynamic>> stages = [];

  int addStage() {
    stages.add({
      "start_z": 0.0,
      "stop_z": 0.0,
      "pitch": 0.0,
      "overlap_h": 0,
      "overlap_v": 0,
      "R": 0.0,
    });
    notifyListeners();
    return stages.length - 1;
  }

  final form = FormGroup({
    'type': FormControl<bool>(value: true, validators: [Validators.required]),
    'start_z': FormControl<double>(
        value: 0.0, validators: [Validators.min(0.0), Validators.required]),
    'stop_z': FormControl<double>(
        value: 0.0, validators: [Validators.min(0.0), Validators.required]),
    'R': FormControl<double>(
        value: 0.0, validators: [Validators.min(0.0), Validators.required]),
    'pitch': FormControl<double>(value: 0.0, validators: [
      Validators.min(0.0),
      Validators.max(90.0),
      Validators.required
    ]),
    'overlap_h': FormControl<int>(value: 50, validators: [
      Validators.min(0),
      Validators.max(100),
      Validators.required
    ]),
    'overlap_v': FormControl<int>(value: 50, validators: [
      Validators.min(0),
      Validators.max(100),
      Validators.required
    ]),
  });

  //List<Map<String, dynamic>> get stages => _stages;

  void updateFormValue(int i) {
    form.control("start_z").value = stages[i]["start_z"];
    form.control("stop_z").value = stages[i]["stop_z"];
    form.control("overlap_h").value = stages[i]["overlap_h"];
    form.control("overlap_v").value = stages[i]["overlap_v"];
    form.control("R").value = stages[i]["R"];
    form.control("pitch").value = stages[i]["pitch"];

    notifyListeners();
  }

  void writeFormToStage(int i) {
    stages[i]["start_z"] = form.control("start_z").value;
    stages[i]["stop_z"] = form.control("stop_z").value;
    stages[i]["overlap_h"] = form.control("overlap_h").value;
    stages[i]["overlap_v"] = form.control("overlap_v").value;
    stages[i]["R"] = form.control("R").value;
    stages[i]["pitch"] = form.control("pitch").value;
    notifyListeners();
  }

  void deleteStage(int i) {
    stages.removeAt(i);
    notifyListeners();
  }

  MissionPageViewModel() {
    /*uavMarker = LatLng(0, 0);
    stub = MavControlClient(channel);
    const oneSec = const Duration(milliseconds: 300);
    new Timer.periodic(oneSec, (Timer t) => updateUavMarker());*/
  }
}
