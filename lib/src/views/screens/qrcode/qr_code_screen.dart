import 'package:flutter/material.dart';
import 'package:garudahacks/src/views/widgets/common/custom_title_text.dart';
import 'package:garudahacks/src/utils/extensions.dart';

class QrCodeScreen extends StatefulWidget {

  @override
  _QrCodeScreenState createState() => _QrCodeScreenState();
}

class _QrCodeScreenState extends State<QrCodeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: <Widget>[
            Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/splash-screen.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: _topDoctorSection(),
                    ),
                    Expanded(
                      flex: 4,
                      child: _topCameraSection(),
                    ),
                    Expanded(
                      flex: 1,
                      child: _topDoctorSection(),
                    )
                  ],
                )
            ),
            _appBar(),
//            _searchSection().onlyPaddingTop100,
          ],
        )
    );
  }

  Widget _topDoctorSection() {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
        color: Colors.white,
      ),
      );
  }

  Widget _topCameraSection() {
    return Container(
      height: 10,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
        color: Colors.transparent,
      ),
    );
  }

  Widget _appBar() {
    return Container(
      margin: EdgeInsets.only(top:40),
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
          TitleText(text: "Pairing", fontSize: 14, fontWeight: FontWeight.w200, color: Colors.white,)
        ],
      ),
    );
  }

//  Widget _infoSection() {
//    return
//  }

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

