import 'package:flutter/material.dart';

extension OnPressed on Widget {
  Widget  ripple(Function onPressed, {BorderRadiusGeometry borderRadius =const BorderRadius.all(Radius.circular(5))}) => Stack(
    children: <Widget>[
      this,
      Positioned(
        left: 0,
        right: 0,
        top: 0,
        bottom: 0,
        child: FlatButton(
            shape: RoundedRectangleBorder(
                borderRadius: borderRadius
            ),
            onPressed: () {
              if (onPressed != null) {
                onPressed();
              }
            },
            child: Container()),
      )
    ],
  );
}

extension PaddingHelper on Widget {
  Padding get p16 => Padding(padding: EdgeInsets.all(16), child: this);

  /// Set padding according to `value`
  Padding p(double value) =>
      Padding(padding: EdgeInsets.all(value), child: this);

  /// Horizontal Padding 16
  Padding get hP4 => Padding(padding: EdgeInsets.symmetric(horizontal: 4), child: this);
  Padding get hP8 => Padding(padding: EdgeInsets.symmetric(horizontal: 8), child: this);
  Padding get hP16 => Padding(padding: EdgeInsets.symmetric(horizontal: 16), child: this);

  Padding get vP32 =>
      Padding(padding: EdgeInsets.symmetric(vertical: 32), child: this);
  /// Vertical Padding 16
  Padding get vP16 =>
      Padding(padding: EdgeInsets.symmetric(vertical: 16), child: this);
  Padding get vP8 =>
      Padding(padding: EdgeInsets.symmetric(vertical: 8), child: this);
  Padding get vP4 =>
      Padding(padding: EdgeInsets.symmetric(vertical: 8), child: this);

  Padding get onlyPaddingTop100 =>
      Padding(padding: EdgeInsets.only(top: 100), child: this);

  Padding get onlyPaddingTop150 =>
      Padding(padding: EdgeInsets.only(top: 150), child: this);
}
