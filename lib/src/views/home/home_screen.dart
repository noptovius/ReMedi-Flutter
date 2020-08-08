import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:garudahacks/src/services/api_service.dart';
import 'package:garudahacks/src/utils/destination.dart';
import 'package:garudahacks/src/views/widgets/common/destination_widget.dart';
import 'package:provider/provider.dart';

const String movieRoute = '/';
const String tvShowRoute = '/tv-show';
int _currentIndex = 0;

class HomeScreen extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with TickerProviderStateMixin<HomeScreen> {
  List<Key> _destinationKeys;
  List<AnimationController> _faders;
  AnimationController _hide;

//  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();

    _faders =
        allDestinations.map<AnimationController>((Destination destination) {
          return AnimationController(
              vsync: this, duration: Duration(milliseconds: 200));
        }).toList();
    _faders[_currentIndex].value = 1.0;
    _destinationKeys =
        List<Key>.generate(allDestinations.length, (int index) => GlobalKey())
            .toList();
    _hide = AnimationController(vsync: this, duration: kThemeAnimationDuration);
  }

  @override
  void dispose() {
    for (AnimationController controller in _faders) controller.dispose();
    _hide.dispose();
    super.dispose();
  }

  bool _handleScrollNotification(ScrollNotification notification) {
    if (notification.depth == 0) {
      if (notification is UserScrollNotification) {
        final UserScrollNotification userScroll = notification;
        switch (userScroll.direction) {
          case ScrollDirection.forward:
            _hide.forward();
            break;
          case ScrollDirection.reverse:
            _hide.reverse();
            break;
          case ScrollDirection.idle:
            break;
        }
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Provider(
        create: (_) => ApiService.create(),
        dispose: (_, ApiService service) => service.client.dispose(),
        child: NotificationListener<ScrollNotification>(
          onNotification: _handleScrollNotification,
          child: Scaffold(
            body: SafeArea(
              top: false,
              child: Stack(
                fit: StackFit.expand,
                children: allDestinations.map((Destination destination) {
                  final Widget view = FadeTransition(
                    opacity: _faders[destination.index]
                        .drive(CurveTween(curve: Curves.fastOutSlowIn)),
                    child: KeyedSubtree(
                      key: _destinationKeys[destination.index],
                      child: DestinationView(
                        destination: destination,
                        onNavigation: () {
                          _hide.forward();
                        },
                        currentIndex: _currentIndex,
                      ),
                    ),
                  );
                  if (destination.index == _currentIndex) {
                    _faders[destination.index].forward();
                    return view;
                  } else {
                    _faders[destination.index].reverse();
                    if (_faders[destination.index].isAnimating) {
                      return IgnorePointer(child: view);
                    }
                    return Offstage(child: view);
                  }
                }).toList(),
              ),
            ),
          ),
        ));
  }
}