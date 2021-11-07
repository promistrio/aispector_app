import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../business_logic/view_models/missionpage_viewmodel.dart';
import 'package:reactive_forms/reactive_forms.dart';

class EditStagePage extends StatelessWidget {
  final int stageId;
  const EditStagePage({Key? key, required this.stageId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _type = ["Vertical snake", "Spiral"];
    MissionPageViewModel missionManager =
        Provider.of<MissionPageViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Stage ${stageId + 1}'),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 14, color: Colors.white),
              primary: Colors.white,
            ),
            onPressed: () {
              missionManager.deleteStage(stageId);
              Navigator.pop(context);
            },
            child: const Text('Удалить'),
          ),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 14, color: Colors.white),
              primary: Colors.white,
            ),
            onPressed: () {
              missionManager.writeFormToStage(stageId);
              Navigator.pop(context);
            },
            child: const Text('Сохранить'),
          ),
        ],
      ),
      body: ListView(
        children: [
          ReactiveForm(
            formGroup: missionManager.form,
            child: ReactiveDropdownField<bool>(
              formControlName: 'type',
              decoration: const InputDecoration(
                labelText: 'Тип',
              ),
              items: const [
                DropdownMenuItem(value: true, child: Text('Спираль')),
                DropdownMenuItem(value: false, child: Text('Змейка/Зиг-Заг')),
              ],
            ),
          ),
          ReactiveForm(
            formGroup: missionManager.form,
            child: ReactiveTextField<double>(
              formControlName: 'start_z',
              keyboardType: TextInputType.number,
              showErrors: (control) => control.invalid,
              decoration: const InputDecoration(
                labelText: 'Начальная высота, метры',
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
                labelText: 'Конечная высота, метры',
              ),
              validationMessages: (control) => {
                ValidationMessage.min: 'Значение должно быть не меньше нуля',
              },
            ),
          ),
          ReactiveForm(
            formGroup: missionManager.form,
            child: ReactiveTextField<double>(
              formControlName: 'R',
              keyboardType: TextInputType.number,
              showErrors: (control) => control.invalid,
              decoration: const InputDecoration(
                labelText: 'Дистанция до объекта, метры',
              ),
              validationMessages: (control) => {
                ValidationMessage.min: 'Значение должно быть не меньше нуля',
              },
            ),
          ),
          ReactiveForm(
            formGroup: missionManager.form,
            child: ReactiveTextField<double>(
              formControlName: 'pitch',
              keyboardType: TextInputType.number,
              showErrors: (control) => control.invalid,
              decoration: const InputDecoration(
                labelText: 'Наклон камеры, градусы',
              ),
              validationMessages: (control) => {
                ValidationMessage.min: 'Значение должно быть в диапазоне 0-90',
                ValidationMessage.max: 'Значение должно быть в диапазоне 0-90',
              },
            ),
          ),
          ReactiveForm(
            formGroup: missionManager.form,
            child: ReactiveTextField<int>(
              formControlName: 'overlap_h',
              keyboardType: TextInputType.number,
              showErrors: (control) => control.invalid,
              decoration: const InputDecoration(
                labelText: 'Горизонтальное перекрытие, %',
              ),
              validationMessages: (control) => {
                ValidationMessage.min: 'Значение должно быть в диапазоне 0-100',
                ValidationMessage.max: 'Значение должно быть в диапазоне 0-100',
              },
            ),
          ),
          ReactiveForm(
            formGroup: missionManager.form,
            child: ReactiveTextField<int>(
              formControlName: 'overlap_v',
              keyboardType: TextInputType.number,
              showErrors: (control) => control.invalid,
              decoration: const InputDecoration(
                labelText: 'Вертикальное перекрытие',
              ),
              validationMessages: (control) => {
                ValidationMessage.min: 'Значение должно быть в диапазоне 0-100',
                ValidationMessage.max: 'Значение должно быть в диапазоне 0-100',
              },
            ),
          ),
        ],
      ),
    );
  }
}
