import 'package:flutter/material.dart';
import 'package:garudahacks/src/utils/destination.dart';
import 'package:garudahacks/src/views/home/dashboard/dashboard_screen.dart';
import 'package:garudahacks/src/views/home/profile/profile_screen.dart';

class DestinationView extends StatefulWidget {
  const DestinationView({Key key, this.destination, this.onNavigation, this.currentIndex})
      : super(key: key);

  final Destination destination;
  final VoidCallback onNavigation;
  final int currentIndex;
  @override
  _DestinationViewState createState() {
    return _DestinationViewState(currentIndex);
  }
}

class _DestinationViewState extends State<DestinationView> {
  _DestinationViewState(this.currentIndex);
  final int currentIndex;
  @override
  Widget build(BuildContext context) {
    return Navigator(
      observers: <NavigatorObserver>[
        ViewNavigatorObserver(widget.onNavigation),
      ],
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          settings: settings,
          builder: (BuildContext context) {
            if (currentIndex < 1) {
              return DashboardScreen(title: "TEst");
            } else {
              return ProfileScreen(title: "Profile");
            }
          },
        );
      },
    );
  }
}

class ViewNavigatorObserver extends NavigatorObserver {
  ViewNavigatorObserver(this.onNavigation);

  final VoidCallback onNavigation;

  void didPop(Route<dynamic> route, Route<dynamic> previousRoute) {
    onNavigation();
  }

  void didPush(Route<dynamic> route, Route<dynamic> previousRoute) {
    onNavigation();
  }
}