import 'dart:convert';

import 'package:airspector/business_logic/models/points.dart';
import 'package:airspector/business_logic/models/stages.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:airspector/business_logic/providers/mission_provider.dart';

class RunMissionPage extends StatelessWidget {
  final Stages stages;
  final form = FormGroup({
    'waypointsCount': FormControl<int>(value: 0),
    'missionDuration': FormControl<int>(value: 0),
  });

  RunMissionPage({Key? key, required this.stages}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    MissionProvider missionProvider = Provider.of<MissionProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Запуск миссии'),
      ),
      body: FutureBuilder<WayPoints>(
        future: missionProvider
            .waypoints, // a previously-obtained Future<String> or null
        builder: (BuildContext context, AsyncSnapshot<WayPoints> snapshot) {
          List<Widget> children;
          if (snapshot.hasData) {
            form.control("waypointsCount").value = snapshot.data?.count;
            form.control("missionDuration").value = snapshot.data?.duration;
            children = <Widget>[
              ReactiveForm(
                formGroup: form,
                child: ReactiveTextField<int>(
                  formControlName: 'waypointsCount',
                  keyboardType: TextInputType.number,
                  showErrors: (control) => control.invalid,
                  decoration: const InputDecoration(
                    labelText: 'Количество полетных точек',
                  ),
                  validationMessages: (control) => {
                    ValidationMessage.min:
                        'Значение должно быть не меньше нуля',
                  },
                ),
              ),
              ReactiveForm(
                formGroup: form,
                child: ReactiveTextField<int>(
                  formControlName: 'missionDuration',
                  keyboardType: TextInputType.number,
                  showErrors: (control) => control.invalid,
                  decoration: const InputDecoration(
                    labelText: 'расчетная длительность полета',
                  ),
                  validationMessages: (control) => {
                    ValidationMessage.min:
                        'Значение должно быть не меньше нуля',
                  },
                ),
              ),
            ];
          } else if (snapshot.hasError) {
            children = <Widget>[
              const Icon(
                Icons.error_outline,
                color: Colors.red,
                size: 60,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text('Error: '),
              )
            ];
          } else {
            children = const <Widget>[
              SizedBox(
                child: CircularProgressIndicator(),
                width: 60,
                height: 60,
              ),
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text('Awaiting result...'),
              )
            ];
          }
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: children,
            ),
          );
        },
      ),
    );
  }
}
