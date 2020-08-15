import 'package:flutter/material.dart';
import 'package:garudahacks/src/utils/extensions.dart';
import 'package:garudahacks/src/views/screens/home/home_screen.dart';
import 'package:garudahacks/src/views/widgets/common/app_color.dart';
import 'package:garudahacks/src/views/widgets/common/custom_title_text.dart';
import 'package:garudahacks/src/views/widgets/splash/fade_transition_route.dart';
import 'package:qr_flutter/qr_flutter.dart';

class PassCodeScreen extends StatefulWidget {
  final String email;
  final String newEmail;
  final bool isGuestCheckOut;

  const PassCodeScreen({
    Key key,
    @required this.email,
    this.newEmail = "",
    this.isGuestCheckOut,
  }) : super(key: key);

  @override
  _PassCodeScreenState createState() => new _PassCodeScreenState();
}

class _PassCodeScreenState extends State<PassCodeScreen>
    with SingleTickerProviderStateMixin {
  // Variables
  Size _screenSize;
  int _currentDigit;
  int _firstDigit;
  int _secondDigit;
  int _thirdDigit;
  int _fourthDigit;
  int _fifthDigit;
  int _sixthDigit;

  // Returns "Appbar"
  get _getAppbar {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      centerTitle: true,
    );
  }

  get _getTitle {
    return Text(
      "Input Your Security Code",
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 16.0, color: Colors.white),
    );
  }

  // Return "Password" input field
  Widget _getInputField() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _passwordTextField(_firstDigit),
        _passwordTextField(_secondDigit),
        _passwordTextField(_thirdDigit),
        _passwordTextField(_fourthDigit),
        _passwordTextField(_fifthDigit),
        _passwordTextField(_sixthDigit),
      ],
    );
  }

  // Returns "Password" input part
  get _getInputPart {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _getTitle,
        _getInputField(),
        _getOtpKeyboard(),
        _showBarcodeSection()
      ],
    );
  }

  Widget _showBarcodeSection() {
    return Container(
      padding: EdgeInsets.all(16),
      child: TitleText(
        text: "SHOW BARCODE",
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: AppColor.white,
      ),
    ).ripple(() {
      _settingQrBottomSheet(context);
    });
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
                      color: Colors.white,
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

  // Returns "Password" keyboard
  Widget _getOtpKeyboard() {
    return Container(
        height: _screenSize.width - 80,
        child: Column(
          children: <Widget>[
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _passwordKeyboardInputButton(
                      label: "1",
                      onPressed: () {
                        _setCurrentDigit(1);
                      }),
                  _passwordKeyboardInputButton(
                      label: "2",
                      onPressed: () {
                        _setCurrentDigit(2);
                      }),
                  _passwordKeyboardInputButton(
                      label: "3",
                      onPressed: () {
                        _setCurrentDigit(3);
                      }),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _passwordKeyboardInputButton(
                      label: "4",
                      onPressed: () {
                        _setCurrentDigit(4);
                      }),
                  _passwordKeyboardInputButton(
                      label: "5",
                      onPressed: () {
                        _setCurrentDigit(5);
                      }),
                  _passwordKeyboardInputButton(
                      label: "6",
                      onPressed: () {
                        _setCurrentDigit(6);
                      }),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _passwordKeyboardInputButton(
                      label: "7",
                      onPressed: () {
                        _setCurrentDigit(7);
                      }),
                  _passwordKeyboardInputButton(
                      label: "8",
                      onPressed: () {
                        _setCurrentDigit(8);
                      }),
                  _passwordKeyboardInputButton(
                      label: "9",
                      onPressed: () {
                        _setCurrentDigit(9);
                      }),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _passwordKeyboardInputButton(
                      label: "",
                      onPressed: () {
                        print("hello world");
                      }),
                  _passwordKeyboardInputButton(
                      label: "0",
                      onPressed: () {
                        _setCurrentDigit(0);
                      }),
                  _passwordKeyboardActionButton(
                      label: Icon(
                        Icons.backspace,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        setState(() {
                          if (_sixthDigit != null)
                            _sixthDigit = null;
                          else if (_fifthDigit != null)
                            _fifthDigit = null;
                          else if (_fourthDigit != null)
                            _fourthDigit = null;
                          else if (_thirdDigit != null)
                            _thirdDigit = null;
                          else if (_secondDigit != null)
                            _secondDigit = null;
                          else if (_firstDigit != null) _firstDigit = null;
                        });
                      }),
                ],
              ),
            ),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/base.png'),
            fit: BoxFit.cover,
          ),
        ),
        width: _screenSize.width,
        child: _getInputPart,
      ),
    );
  }

  // Returns "Password custom text field"
  Widget _passwordTextField(int digit) {
    return Container(
      margin: EdgeInsets.only(bottom: 0),
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        color: digit != null ? Colors.white : Colors.transparent,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 1),
      ),
    );
  }

  // Returns "Password keyboard input Button"
  Widget _passwordKeyboardInputButton({String label, VoidCallback onPressed}) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        borderRadius: new BorderRadius.circular(40.0),
        child: Container(
          height: 80.0,
          width: 80.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Returns "Password keyboard action Button"
  _passwordKeyboardActionButton({Widget label, VoidCallback onPressed}) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(40.0),
      child: Container(
        height: 80.0,
        width: 80.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: Center(
          child: label,
        ),
      ),
    );
  }

  // Current digit
  void _setCurrentDigit(int i) {
    setState(() {
      _currentDigit = i;
      if (_firstDigit == null)
        _firstDigit = _currentDigit;
      else if (_secondDigit == null)
        _secondDigit = _currentDigit;
      else if (_thirdDigit == null)
        _thirdDigit = _currentDigit;
      else if (_fourthDigit == null)
        _fourthDigit = _currentDigit;
      else if (_fifthDigit == null)
        _fifthDigit = _currentDigit;
      else if (_sixthDigit == null) _sixthDigit = _currentDigit;

      var password = _firstDigit.toString() +
          _secondDigit.toString() +
          _thirdDigit.toString() +
          _fourthDigit.toString() +
          _fifthDigit.toString() +
          _sixthDigit.toString();

      // Verify your password by here. API call
      if (password == "112233") {
        Navigator.of(context)
            .pushReplacement(FadeTransitionRoute(page: HomeScreen()));
      }
    });
  }
}
