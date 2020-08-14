import 'dart:async';

import 'package:flutter/material.dart';
import 'package:garudahacks/src/views/widgets/splash/fade_transition_route.dart';

class SplashWidget extends StatefulWidget {
  BuildContext context;
  Widget splashscreenWidget;
  Widget gotoWidget;
  int timerInSeconds;

  SplashWidget(
      {@required this.context,
      @required this.splashscreenWidget,
      @required this.gotoWidget,
      @required this.timerInSeconds});

  @override
  _SplashWidgetState createState() => _SplashWidgetState();
}

class _SplashWidgetState extends State<SplashWidget> {
  @override
  void initState() {
    super.initState();
    int timerInSeconds1 = 1;
    timerInSeconds1 = widget.timerInSeconds;
    Timer(
        Duration(seconds: timerInSeconds1),
        () => Navigator.of(context)
            .pushReplacement(FadeTransitionRoute(page: widget.gotoWidget)));
  }

  @override
  Widget build(BuildContext context) {
    return widget.splashscreenWidget;
  }
}
