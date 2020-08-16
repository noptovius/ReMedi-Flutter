import 'package:flutter/material.dart';
import 'package:garudahacks/src/views/widgets/common/custom_title_text.dart';
import 'package:garudahacks/src/utils/extensions.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'dart:ui';
import 'package:flutter/rendering.dart';

class QrCodeScreen extends StatefulWidget {
  @override
  _QrCodeScreenState createState() => _QrCodeScreenState();
}

class _QrCodeScreenState extends State<QrCodeScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/base.png"),
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
                      child: _infoSection(),
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }

  Widget _topDoctorSection() {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
      ),
      child: Column(
        children: [
          _appBar(),
        ],
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 200,
            height: 200,
            child: QRView(
              key: qrKey,
              onQRViewCreated: (controller) {
                controller.scannedDataStream.listen((value) {
                  setState(() {});
                });
              },
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: RaisedButton(
              onPressed: () => _settingQrBottomSheet(context),
              color: Colors.black,
              child: Text(
                "Show QR",
                style: TextStyle(
                  color: Colors.white,
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
            text: "Pairing",
            fontSize: 14,
            fontWeight: FontWeight.w200,
            color: Colors.white,
          )
        ],
      ),
    );
  }

  Widget _infoSection() {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(20),
      child: Text(
        "Just scan QR code for adding friends or sharing medical record with the doctor",
        textAlign: TextAlign.center,
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

  void _settingQrBottomSheet(context) {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        context: context,
        builder: (BuildContext bc) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  margin: EdgeInsets.only(
                    left: 40,
                    right: 40,
                    top: 40,
                    bottom: 20,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 4,
                    ),
                  ),
                  child: QrImage(
                    data: "1",
                    version: QrVersions.auto,
                    size: 200.0,
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  child: Text(
                    "Your medical record will be shared with the doctor or You'll be " +
                        "added as a friend when your friend scans your QR Code",
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          );
        });
  }
}
