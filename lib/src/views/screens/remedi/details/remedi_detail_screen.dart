import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:garudahacks/src/models/doctor/doctor.dart';
import 'package:garudahacks/src/utils/constant.dart';
import 'package:garudahacks/src/utils/extensions.dart';
import 'package:garudahacks/src/views/screens/remedi/details/remedi_detail_content.dart';
import 'package:garudahacks/src/views/widgets/common/app_theme.dart';
import 'package:garudahacks/src/views/widgets/common/custom_title_text.dart';

class ReMediDetailScreen extends StatefulWidget {
  @override
  _ReMediDetailScreenState createState() => _ReMediDetailScreenState();
}

class _ReMediDetailScreenState extends State<ReMediDetailScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Container(
              color: Colors.transparent,
              child: SingleChildScrollView(
                child: Container(
                  height: AppTheme.fullHeight(context) - 50,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/base.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      _appBar().onlyPaddingTop50,
                      _title(context),
                      Expanded(
                        child: AnimatedSwitcher(
                            duration: Duration(milliseconds: 300),
                            switchInCurve: Curves.easeInToLinear,
                            switchOutCurve: Curves.easeOutBack,
                            child: ReMediDetailContent()),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
      ),
    );
  }

  Widget _appBar() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          _icon(
            Icons.arrow_back_ios,
            color: Colors.black54,
            size: 15,
            padding: 12,
            isOutLine: true,
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TitleText(
            text: "Medical Record Details",
            fontSize: 14,
            fontWeight: FontWeight.w200,
          )
        ],
      ),
    );
  }

  Widget _title(BuildContext buildContext) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
                margin: AppTheme.padding,
                child: Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      _icon(Icons.account_box,
                          color: Colors.white,
                          backgroundIcon: Constant.PRIMARY_COLOR),
                      SizedBox(width: 10),
                      _activeDoctorSection(
                          "dr. Jajang Nurjana, Sp.JP", 16, "Jakarta Hospital", 12),
                    ],
                  ),
                )),
          ],
        ));
  }

  Widget _activeDoctorSection(
      String title, double titleSize, String subtitle, double subtitleSize) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TitleText(
              text: title, fontSize: titleSize, fontWeight: FontWeight.w400),
          Row(
            children: <Widget>[
              SizedBox(),
              Icon(Icons.location_on, size: 14,),
              SizedBox(width: 5,),
              TitleText(
                  text: subtitle,
                  fontSize: subtitleSize,
                  fontWeight: FontWeight.w400),
            ],
          )
        ],
      ),
    );
  }

  Widget _icon(
    IconData icon, {
    Color color = Colors.white,
    Color backgroundIcon = Colors.transparent,
    double size = 20,
    double padding = 10,
    bool isOutLine = false,
    Function onPressed,
  }) {
    return Container(
      height: 40,
      width: 40,
      padding: EdgeInsets.all(padding),
      color: backgroundIcon,
      child: Icon(icon, color: color, size: size),
    ).ripple(() {
      if (onPressed != null) {
        onPressed();
      }
    }, borderRadius: BorderRadius.all(Radius.circular(30)));
  }
}
