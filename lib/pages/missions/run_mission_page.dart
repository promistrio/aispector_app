import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../bloc/mission_manager.dart';
import 'package:reactive_forms/reactive_forms.dart';

class RunMissionPage extends StatelessWidget {
  const RunMissionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _type = ["Vertical snake", "Spiral"];
    MissionManager missionManager = Provider.of<MissionManager>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Запуск миссии'),
      ),
      body: ListView(
        children: [
          ReactiveForm(
            formGroup: missionManager.form,
            child: ReactiveTextField<double>(
              formControlName: 'start_z',
              keyboardType: TextInputType.number,
              showErrors: (control) => control.invalid,
              decoration: const InputDecoration(
                labelText: 'Количество полетных точек',
              ),
              validationMessages: (control) => {
                ValidationMessage.min: 'Значение должно быть не меньше нуля',
              },
            ),
          ),
          ReactiveForm(
            formGroup: missionManager.form,
            child: ReactiveTextField<double>(
              formControlName: 'stop_z',
              keyboardType: TextInputType.number,
              showErrors: (control) => control.invalid,
              decoration: const InputDecoration(
                labelText: 'расчетная длительность полета',
              ),
              validationMessages: (control) => {
                ValidationMessage.min: 'Значение должно быть не меньше нуля',
              },
            ),
          ),
        ],
      ),
    );
  }
}
