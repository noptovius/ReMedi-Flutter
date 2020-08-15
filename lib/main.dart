import 'package:flutter/material.dart';
import 'package:garudahacks/src/services/api_service.dart';
import 'package:garudahacks/src/utils/destination.dart';
import 'package:garudahacks/src/views/screens/auth/passcode_screen.dart';
import 'package:garudahacks/src/views/screens/catalogue/catalogue_screen.dart';
import 'package:garudahacks/src/views/screens/doctor/doctor_detail_screen.dart';
import 'package:garudahacks/src/views/screens/home/home_screen.dart';
import 'package:garudahacks/src/views/screens/splash/splash_screen.dart';
import 'package:garudahacks/src/views/widgets/splash/splash_widget.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';

import 'src/views/screens/auth/passcode_screen.dart';
import 'src/views/screens/splash/splash_screen.dart';

void main() {
  _setupLogging();
  runApp(
      MaterialApp(
        home: MainScreen(),
        routes: {
            '/home': (context) => HomeScreen(),
            '/catalogue': (context) => CatalogueScreen()
        },
      )
  );
}

int _currentIndex = 0;
class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => ApiService.create(),
      dispose: (_, ApiService service) => service.client.dispose(),
      child: SplashWidget(
        context: context,
        gotoWidget: PassCodeScreen(),
        splashscreenWidget: SplashScreen(),
        timerInSeconds: 5,
      ),
    );
  }
}

class DestinationView extends StatefulWidget {
  const DestinationView({Key key, this.destination, this.onNavigation})
      : super(key: key);

  final Destination destination;
  final VoidCallback onNavigation;

  @override
  _DestinationViewState createState() => _DestinationViewState();
}

class _DestinationViewState extends State<DestinationView> {
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
            if (_currentIndex < 1) {
              return MoviePage(destination: widget.destination);
            } else {
              return TvShowPage(destination: widget.destination);
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

void _setupLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((rec) {
    print('${rec.level.name}: ${rec.time}: ${rec.message}');
  });
}
