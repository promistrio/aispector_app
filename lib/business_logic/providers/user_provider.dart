import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// Models
import 'package:airspector/business_logic/models/user/auth.dart';

class UserProvider with ChangeNotifier, DiagnosticableTreeMixin {
  //Future<WayPoints> get waypoints => missionController.waypoinsFromApi;

  // add stage to end and return id
  int login(String email) {
    notifyListeners();
    return 0;
  }
}
