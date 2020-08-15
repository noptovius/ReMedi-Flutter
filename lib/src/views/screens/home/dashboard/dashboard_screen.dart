import 'package:flutter/material.dart';
import 'package:garudahacks/src/views/screens/remedi/remedi_screen.dart';
import 'package:garudahacks/src/views/widgets/bottomnavigation/floating_navbar.dart';
import 'package:garudahacks/src/views/widgets/bottomnavigation/floating_navbar_item.dart';

import '../../../widgets/splash/fade_transition_route.dart';

class DashboardScreen extends StatefulWidget {
  DashboardScreen({Key key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        child: DraggableScrollableActuator(
          child: Stack(
            children: <Widget>[
              DraggableScrollableSheet(
                initialChildSize: 1.0,
                minChildSize: 0.5,
                maxChildSize: 1.0,
                builder:
                    (BuildContext context, ScrollController scrollController) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16.0),
                        topRight: Radius.circular(16.0),
                      ),
                    ),
                    child: Scaffold(
                      backgroundColor: Colors.transparent,
                      body: ListView.builder(
                        controller: scrollController,
                        // ignore: missing_return
                        itemBuilder: (BuildContext context, int index) {

                        },
                      ),
                      bottomNavigationBar: FloatingNavBar(
                          onTap: (int val) {
                            switch (val) {
                              case 0:
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => ReMediScreen())
                                );
                                break;
                              case 1:
                                break;
                              case 2:
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => ReMediScreen())
                                );
                                break;
                              case 3:
                                break;
                            }
                            if (val == 0) {

                            }
                          },
                          items: [
                            FloatingNavBarItem(icon: Icons.account_circle, title: 'Profile'),
                            FloatingNavBarItem(icon: Icons.local_hospital, title: 'Catalogue'),
                            FloatingNavBarItem(icon: Icons.event_note, title: 'ReMedi'),
                            FloatingNavBarItem(icon: Icons.event, title: 'Schedule'),
                          ],
                        ),
                      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
                      floatingActionButton: Container(
                        height: 65.0,
                        width: 65.0,
                        child: FittedBox(
                          child: FloatingActionButton(
                            onPressed: () {},
                            child: Icon(
                              Icons.account_box,
                              color: Colors.white,
                            ),
                            // elevation: 5.0,
                          ),
                        ),
                      ),
                    )
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}