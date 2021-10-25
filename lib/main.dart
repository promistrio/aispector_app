import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'pages/missions/mission_page.dart';
import 'bloc/mission_manager.dart';

/// This is a reimplementation of the default Flutter application using provider + [ChangeNotifier].
void main() {
  runApp(
    /// Providers are above [MyApp] instead of inside it, so that tests
    /// can use [MyApp] while mocking the providers
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MissionManager()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // Define the default brightness and colors.
        //brightness: Brightness.dark,
        primaryColor: const Color(0xFF3F51B5),
        appBarTheme: const AppBarTheme(color: Color(0xFF3F51B5)),

        // Define the default font family.
        fontFamily: 'Roboto',

        // Define the default `TextTheme`. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
      ),
      home: MissionPage(),
    );
  }
}
