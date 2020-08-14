import 'package:flutter/material.dart';

class SosScreen extends StatefulWidget {
  SosScreen({Key key}) : super(key: key);
  @override
  _SosScreenState createState() => _SosScreenState();
}

class _SosScreenState extends State<SosScreen> {
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
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: ListView.builder(
                                controller: scrollController,
                                // ignore: missing_return
                                itemBuilder: (BuildContext context, int index) {
                                  return;
                                }
                            ),
                          ),
                          Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(90.0),
                                    child: Container(
                                      color: Colors.red,
                                      width: 120,
                                      height: 120,
                                    ),
                                  )
                                ],
                              )
                          ),
                        ],
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