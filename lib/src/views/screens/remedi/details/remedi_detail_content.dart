import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:garudahacks/src/utils/extensions.dart';
import 'package:garudahacks/src/views/widgets/common/app_color.dart';
import 'package:garudahacks/src/views/widgets/common/app_font.dart';
import 'package:garudahacks/src/views/widgets/common/app_theme.dart';
import 'package:garudahacks/src/views/widgets/common/custom_title_text.dart';

class ReMediDetailContent extends StatefulWidget {

  @override
  _ReMediDetailContentState createState() => _ReMediDetailContentState();
}

class _ReMediDetailContentState extends State<ReMediDetailContent> {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height - 210,
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        dragStartBehavior: DragStartBehavior.down,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            _commonSection("Symptoms", "6 Total", Colors.green),
            _commonSection("Diagnosed", "2 Total", Colors.pink),
            _medicinesSection(),
            _examinationsSection()
          ],
        ),
      ),
    );
  }

  Widget _commonSection(String title, String size, Color color) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 8, right: 16, left: 16, bottom: 4),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _titleSection(title, 16, size, 12),
            ],
          ),
        ),
        SizedBox(
          height: AppTheme.fullHeight(context) * .15,
          width: AppTheme.fullWidth(context),
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) =>
                _circleItem(Icon(Icons.account_box), "Bisoprofal", color),
          ).hP16,
        ).vP8,
      ],
    );
  }

  Widget _circleItem(Icon icon, String title, Color color) {
    return Container(
      child: Column(
        children: <Widget>[
          ClipOval(
            child: Material(
              color: color, // button color
              child: SizedBox(width: 80, height: 80, child: icon)
              ),
            ),
          SizedBox(height: 20,),
          TitleText(
            text: title,
            fontSize: 12,
            color: AppColor.black,
          ),
        ],
      ),
    ).hP4;
  }

  Widget _titleSection(String title, double titleSize, String subtitle, double subtitleSize) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TitleText(text: title, fontSize: titleSize, fontWeight: FontWeight.w400),
          TitleText(text: subtitle, fontSize: subtitleSize, fontWeight: FontWeight.w400),
        ],
      ),
    );
  }

  Widget _medicinesSection() {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 8, right: 16, left: 16, bottom: 4),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _titleSection("Medicines", 16, "3 Total", 12),
            ],
          ),
        ),
        SizedBox(
          height: AppTheme.fullHeight(context) * .25,
          width: AppTheme.fullWidth(context),
          child: ListView(
            scrollDirection: Axis.vertical,
            children: <Widget>[
              _medicineTitle("Bisoprofal", "5 mg"),
              SizedBox(height: 5,),
              _medicineTitle("Thrombo Aspilets", "80mg"),
              SizedBox(height: 5,),
              _medicineTitle("Clopidogref", "75mg")
            ],
          ).hP16,
        ).vP8,
      ],
    );
  }

  Widget _medicineTitle(String title, String size) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            offset: Offset(4, 4),
            blurRadius: 10,
            color: AppColor.grey.withOpacity(.2),
          ),
          BoxShadow(
            offset: Offset(-3, 0),
            blurRadius: 15,
            color: AppColor.grey.withOpacity(.1),
          )
        ],
      ),
      child: Container(
        child: ListTile(
          title: Text(title),
          leading: Icon(Icons.account_circle),
          trailing: Text(size),
        ),
      ).ripple(() {
//        Navigator.pushNamed(context, "/DetailPage", arguments: model);
      }, borderRadius: BorderRadius.all(Radius.circular(20))),
    );
  }

  Widget _examinationsSection() {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 8, right: 16, left: 16, bottom: 4),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _titleSection("Examinations", 16, "6 Total", 12),
            ],
          ),
        ),
        SizedBox(
          height: AppTheme.fullHeight(context) * .35,
          width: AppTheme.fullWidth(context),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              _examinationsCard("Chemist & Drugist", "350 + Stores"),
              _examinationsCard("Covid - 19 Specilist", "899 Doctors"),
              _examinationsCard("Cardiologists Specilist", "500 + Doctors")
            ],
          ),
        ).hP8,
      ],
    );
  }

  Widget _examinationsCard(String title, String subtitle) {
    TextStyle titleStyle = TextStyles.title;
    TextStyle subtitleStyle = TextStyles.body;
    if(AppTheme.fullWidth(context) < 392){
      titleStyle = TextStyles.body;
      subtitleStyle = TextStyles.bodySm;
    }
    return AspectRatio(
      aspectRatio: 8 / 8,
      child: Container(
        height: 280,
        width: AppTheme.fullWidth(context) * .5,
        margin: EdgeInsets.only(left: 10, right: 10, bottom: 20, top: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20)),
          border: Border.all(color: AppColor.black),
          boxShadow: <BoxShadow>[
            BoxShadow(
              offset: Offset(4, 4),
              blurRadius: 10,
              color: AppColor.white.withOpacity(.8),
            )
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          child: Container(
            child: Stack(
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _titleSection(subtitle, 12, title, 14),
                    SizedBox(height: 20),
                    _examinationsContent(),
                    SizedBox(height: 40),
                    _examinationsDoctor()
                  ],
                ).hP16.vP32
              ],
            ),
          ),
        ).ripple(() {}, borderRadius: BorderRadius.all(Radius.circular(20))),
      ),
    );
  }

  Widget _examinationsContent() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          TitleText(text: "SUMMARY", fontSize: 12, fontWeight: FontWeight.w400,),
          TitleText(
              text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do "
                  "eiusmod tempor incididunt ut labore et dolore magna aliqua.",
            fontSize: 10,
            fontWeight: FontWeight.w200,
          )
        ],
      ),
    );
  }

  Widget _examinationsDoctor() {
    return Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(), _icon(Icons.account_circle, color: Colors.black),
              SizedBox(width: 10),
              _titleSection("dr. Jajang Nurjana, Sp.JP", 14, "First Diagnosed", 12),
            ],
          ),
    );
  }

  Widget _icon(
      IconData icon, {
        Color color = Colors.white,
        Color backgroundColor = Colors.green,
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
      decoration: BoxDecoration(
        border: Border.all(
            color: Colors.white,
            style: isOutLine ? BorderStyle.solid : BorderStyle.none),
        borderRadius: BorderRadius.all(Radius.circular(100)),
        color:
        isOutLine ? Colors.transparent : Theme.of(context).backgroundColor,
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Color(0xfff8f8f8),
              blurRadius: 5,
              spreadRadius: 10,
              offset: Offset(5, 5)),
        ],
      ),
      child: Icon(icon, color: color, size: size),
    ).ripple(() {
      if (onPressed != null) {
        onPressed();
      }
    }, borderRadius: BorderRadius.all(Radius.circular(13)));
  }

}