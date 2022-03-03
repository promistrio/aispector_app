import 'package:airspector/business_logic/models/points.dart';
import 'package:airspector/business_logic/models/stages.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:airspector/business_logic/providers/mission_provider.dart';

class LoginPage extends StatelessWidget {
  final form = FormGroup({
    'email': FormControl<String>(value: ""),
    'password': FormControl<String>(value: ""),
  });

  LoginPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    MissionProvider missionProvider = Provider.of<MissionProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Авторизация'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ReactiveForm(
              formGroup: form,
              child: ReactiveTextField<String>(
                enableInteractiveSelection: false,
                formControlName: 'email',
                keyboardType: TextInputType.text,
                showErrors: (control) => control.invalid,
                decoration: const InputDecoration(
                  labelText: 'Логин',
                ),
                validationMessages: (control) => {},
              ),
            ),
            ReactiveForm(
              formGroup: form,
              child: ReactiveTextField<String>(
                enableInteractiveSelection: false,
                formControlName: 'password',
                keyboardType: TextInputType.number,
                showErrors: (control) => control.invalid,
                decoration: const InputDecoration(
                  labelText: 'Пароль',
                ),
                validationMessages: (control) => {},
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  missionProvider.missionController
                      .loginMission()
                      .then((value) {
                    form.control("output").value = value;
                    ScaffoldMessenger.of(context)
                      ..removeCurrentSnackBar()
                      ..showSnackBar(
                          const SnackBar(content: Text("Загружено")));
                  });
                },
                child: const Text('Авторизация')),
          ],
        ),
      ),
      /*form.control("waypointsCount").value = snapshot.data?.count;
            form.control("missionDuration").value = snapshot.data?.duration;*/
    );
  }
}
