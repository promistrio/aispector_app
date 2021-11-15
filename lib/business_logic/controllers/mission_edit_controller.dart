import 'package:airspector/business_logic/models/stages.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:airspector/business_logic/controllers/mission_api_controller.dart';

class MissionEditController {
  late List<Stage> stages = [];
  late Stages stagesModel;
  MissionApiController api = MissionApiController();

  MissionEditController() {
    stages = [];
    stagesModel = Stages(stages);
    stages = stagesModel.requests;
    stages.add(Stage(1, 3, 20, 30));
  }

  // add stage to end of list
  int pushStage(Stage stage) {
    stages.add(stage);
    return stages.length - 1;
  }

  // delete stage by ID
  void deleteStage(int i) {
    stages.removeAt(i);
  }

  int getLastStageId() => stages.length - 1;

  void updateFormValue(int idStage) {
    form.control("start_z").value = stages[idStage].start_z;
    form.control("stop_z").value = stages[idStage].stop_z;
    form.control("overlap_h").value = stages[idStage].overlap_h;
    form.control("overlap_v").value = stages[idStage].overlap_v;
    form.control("R").value = stages[idStage].R;
    form.control("pitch").value = stages[idStage].pitch;
  }

  void writeFormToStage(int idStage) {
    stages[idStage].start_z = form.control("start_z").value;
    stages[idStage].stop_z = form.control("stop_z").value;
    stages[idStage].overlap_h = form.control("overlap_h").value;
    stages[idStage].overlap_v = form.control("overlap_v").value;
    stages[idStage].R = form.control("R").value;
    stages[idStage].pitch = form.control("pitch").value;
  }

  void generateMission() {
    api.requestGeneratedMission(stagesModel);
  }

  // form settings
  final form = FormGroup({
    'type': FormControl<bool>(value: true, validators: [Validators.required]),
    'start_z': FormControl<int>(
        value: 0, validators: [Validators.min(0), Validators.required]),
    'stop_z': FormControl<int>(
        value: 0, validators: [Validators.min(0), Validators.required]),
    'R': FormControl<int>(
        value: 0, validators: [Validators.min(0), Validators.required]),
    'pitch': FormControl<int>(value: 0, validators: [
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
}