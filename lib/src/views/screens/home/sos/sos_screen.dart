import 'package:flutter/material.dart';
import 'package:garudahacks/src/utils/extensions.dart';
import 'package:garudahacks/src/views/widgets/common/custom_title_text.dart';

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
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Expanded(
                              flex: 2,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text("PANIC BUTTON"),
                                  Icon(Icons.info)
                                ],
                              )),
                          Expanded(
                              flex: 2,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Stack(
                                    children: <Widget>[
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(90.0),
                                        child: Container(
                                          color: Colors.lightBlueAccent,
                                          width: 130,
                                          height: 130,
                                        ),
                                      ),
                                      Positioned(
                                        left: 10,
                                        top: 10,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(90.0),
                                          child: Container(
                                            color: Colors.lightBlue,
                                            width: 110,
                                            height: 110,
                                            alignment: Alignment.center,
                                            child: TitleText(
                                              text: "S.O.S",
                                              fontSize: 16,
                                              color: Colors.white,
                                            ),
                                          ).ripple(() {}),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              )),
                          Expanded(
                            flex: 1,
                            child: Text("TAP CHOOSE"),
                          ),
                        ],
                      ));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
