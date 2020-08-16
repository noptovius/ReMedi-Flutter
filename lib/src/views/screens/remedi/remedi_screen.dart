import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:garudahacks/src/utils/constant.dart';
import 'package:garudahacks/src/utils/extensions.dart';
import 'package:garudahacks/src/views/screens/remedi/details/remedi_detail_screen.dart';
import 'package:garudahacks/src/views/widgets/common/app_color.dart';
import 'package:garudahacks/src/views/widgets/common/custom_title_text.dart';

class ReMediScreen extends StatefulWidget {
  @override
  _ReMediScreenState createState() => _ReMediScreenState();
}

class _ReMediScreenState extends State<ReMediScreen> {
  final List<String> items = [
    "Blood Pressure",
    "Heart Rate",
    "Body Temperature"
  ];

  final List<String> subItems = [
    "140/90 mmHg",
    "83 bpm",
    "36.7 C"
  ];

  final List<String> images = [
    "blood-preassure",
    "heart-rate",
    "temperature"
  ];

//  Doctor _doctor = Doctor(
//    rating: 4.7,
//    address: "West Jakarta",
//    name: "Dr A",
//    specialization: "Cardiologist",
//  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/base.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      _categorySection("7/28/2020"),
                      _medicalRecordSection(context)
                    ],
                  ),
                ).onlyPaddingTop100,
              ],
            )),
        _appBar(),
      ],
    ));
  }

  Widget _appBar() {
    return Container(
      margin: EdgeInsets.only(top: 40),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          _icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: 15,
            padding: 12,
            isOutLine: true,
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TitleText(
            text: "Medical Record",
            fontSize: 14,
            fontWeight: FontWeight.w200,
            color: Colors.white,
          )
        ],
      ),
    );
  }

  Widget _categorySection(String date) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(20),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Vital Sign",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "Last checked: " + date,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
        _vitalSignItem("Test", "2384092")
      ],
    );
  }

  Widget _vitalSignItem(String vitalText, String vitalValue) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        height: 150,
        child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: items.length,
            itemBuilder: (BuildContext context, int index) => Container(
                  child: Column(
                    children: <Widget>[
                      ClipOval(
                        child: Material(
                          color: Colors.white, // button color
                          child: SizedBox(
                              width: 80, height: 80,
                              child: Image.asset(
                                "assets/images/" +
                                    images[index].toLowerCase() +
                                    ".png",
                                width: 40,
                              ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TitleText(
                        text: items[index],
                        fontSize: 12,
                        color: AppColor.white,
                      ),
                      TitleText(
                        text: subItems[index],
                        fontSize: 12,
                        color: AppColor.white,
                      ),
                    ],
                  ),
                ).hP16),
      ),
    );
  }

  Widget _medicalRecordSection(BuildContext buildContext) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.all(20),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
        color: Colors.white,
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        TitleText(text: "JUN", fontSize: 15,),
        ListView.separated(
          separatorBuilder: (context, index) => Divider(),
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 10,
          itemBuilder: (context, index) => Column(
            children: <Widget>[
              ListTile(
                leading: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                    color: Constant.PRIMARY_COLOR,
                  ),
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                  ),
                ),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TitleText(
                      text: "Test",
                      fontSize: 12,
                    ),
                    Row(
                      children: <Widget>[
                        Icon(Icons.my_location, size: 10,),
                        TitleText(
                          text: "Test",
                          fontSize: 10,
                        ),
                      ],
                    )

                  ],
                ).ripple(() {
                  Navigator.push(
                      buildContext,
                      MaterialPageRoute(
                          builder: (context) => ReMediDetailScreen(
//                            id: doctors[index].id.toString(),
                          )));
                }),
                trailing: Column(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.orangeAccent,
                      size: 16,
                    ),
                    Text(
                      "test",
//                      doctors[index].rating.toString(),
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }

  Widget _icon(
    IconData icon, {
    Color color = Colors.white,
    double size = 20,
    double padding = 10,
    bool isOutLine = false,
    Function onPressed,
  }) {
    return Container(
      height: 40,
      width: 40,
      padding: EdgeInsets.all(padding),
      // margin: EdgeInsets.all(padding),
      color: Colors.transparent,
      child: Icon(icon, color: color, size: size),
    ).ripple(() {
      if (onPressed != null) {
        onPressed();
      }
    }, borderRadius: BorderRadius.all(Radius.circular(13)));
  }
}
