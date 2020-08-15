import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:garudahacks/src/models/doctor.dart';
import 'package:garudahacks/src/utils/constant.dart';
import 'package:garudahacks/src/utils/extensions.dart';
import 'package:garudahacks/src/views/screens/remedi/details/remedi_detail_screen.dart';
import 'package:garudahacks/src/views/widgets/common/app_color.dart';
import 'package:garudahacks/src/views/widgets/common/app_theme.dart';
import 'package:garudahacks/src/views/widgets/common/custom_title_text.dart';

class ReMediScreen extends StatefulWidget {
  @override
  _ReMediScreenState createState() => _ReMediScreenState();
}

class _ReMediScreenState extends State<ReMediScreen> {
  final List<String> items = [
    "General Practicionare",
    "Dentist",
    "Cardiologist",
    "Dermatologist"
  ];

  Doctor _doctor = Doctor(
    rating: 4.7,
    address: "West Jakarta",
    name: "Dr A",
    specialization: "Cardiologist",
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/splash-screen.png"),
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
                          color: Colors.blue, // button color
                          child: SizedBox(
                              width: 80, height: 80, child: Icon(Icons.menu)),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TitleText(
                        text: vitalText,
                        fontSize: 12,
                        color: AppColor.white,
                      ),
                      TitleText(
                        text: vitalValue,
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
      padding: EdgeInsets.only(left: 20, right: 20),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
        color: Colors.white,
      ),
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (index, context) => ListTile(
          leading: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                10,
              ),
              color: Colors.black,
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
              Text(_doctor.name),
              Text(_doctor.specialization),
              Text(_doctor.address)
            ],
          ),
          trailing: Icon(
            Icons.person,
          ),
        ).ripple(() {
          Navigator.push(buildContext,
              MaterialPageRoute(builder: (context) => ReMediDetailScreen()));
        }),
      ),
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
