import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:garudahacks/src/views/screens/home/dashboard/dashboard_screen.dart';
import 'package:garudahacks/src/views/screens/home/history/history_screen.dart';
import 'package:garudahacks/src/views/screens/home/sos/sos_screen.dart';
import 'package:garudahacks/src/views/widgets/tab/custom_tab_indicator.dart';

const String movieRoute = '/';
const String tvShowRoute = '/tv-show';
int _currentIndex = 0;

class HomeScreen extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        initialIndex: 1,
        child: Scaffold(
          body: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/splash-screen.png"), fit: BoxFit.cover)
                ),
              ),
              Scaffold(
                backgroundColor: Colors.transparent,
                appBar: AppBar(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    flexibleSpace: new Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        TabBar(
                            unselectedLabelColor: Colors.black,
                            indicatorSize: TabBarIndicatorSize.label,
                            indicator: CustomTabIndicator(
                              indicatorHeight: 35.0,
                              indicatorColor: Colors.black45,
                              tabBarIndicatorSize: TabBarIndicatorSize.label,
                            ),
                            tabs: [
                              Tab(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8),
                                    ),
                                    IconTheme(
                                      data: IconThemeData(
                                        size: 24,
                                        color: Colors.white,
                                      ),
                                      child: Icon(Icons.history),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 4, right: 4),
                                      child: DefaultTextStyle.merge(
                                          style: TextStyle(color: Colors.white),
                                          child: Text("History")
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Tab(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8),
                                    ),
                                    IconTheme(
                                      data: IconThemeData(
                                        size: 24,
                                        color: Colors.white,
                                      ),
                                      child: Icon(Icons.home),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 4, right: 4),
                                      child: DefaultTextStyle.merge(
                                          style: TextStyle(color: Colors.white),
                                          child: Text("Home")
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Tab(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(left: 14),
                                    ),
                                    IconTheme(
                                      data: IconThemeData(
                                        size: 24,
                                        color: Colors.white,
                                      ),
                                      child: Icon(Icons.call),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 4, right: 4),
                                      child: DefaultTextStyle.merge(
                                          style: TextStyle(color: Colors.white),
                                          child: Text("SOS")
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ]),
                      ],
                    )
                ),
                body: TabBarView(children: [
                  HistoryScreen(),
                  DashboardScreen(),
                  SosScreen(),
                ]),
              )
            ],
          )
        )
    );
  }
}