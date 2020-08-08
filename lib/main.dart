import 'package:flutter/material.dart';
import 'package:garudahacks/src/views/home/home_screen.dart';
import 'package:logging/logging.dart';

void main() {
  _setupLogging();
  runApp(MaterialApp(home: HomeScreen()));
}

void _setupLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((rec) {
    print('${rec.level.name}: ${rec.time}: ${rec.message}');
  });
}

