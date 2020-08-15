import 'package:flutter/material.dart';
import 'package:garudahacks/src/views/screens/auth/passcode_screen.dart';
import 'package:garudahacks/src/views/screens/doctor/doctor_detail_screen.dart';
import 'package:garudahacks/src/views/screens/splash/splash_screen.dart';
import 'package:garudahacks/src/views/widgets/splash/splash_widget.dart';
import 'package:logging/logging.dart';

import 'src/views/screens/auth/passcode_screen.dart';
import 'src/views/screens/splash/splash_screen.dart';

void main() {
  _setupLogging();
  runApp(MaterialApp(home: MainScreen()));
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return SplashWidget(
      context: context,
      gotoWidget: PassCodeScreen(),
      splashscreenWidget: SplashScreen(),
      timerInSeconds: 5,
    );
  }
}

void _setupLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((rec) {
    print('${rec.level.name}: ${rec.time}: ${rec.message}');
  });
}
