import 'package:flutter/material.dart';
import 'package:garudahacks/src/views/widgets/common/app_color.dart';

class AppTheme {
  const AppTheme();
  static ThemeData lightTheme = ThemeData(
      backgroundColor: AppColor.background,
      primaryColor: AppColor.background,
      cardTheme: CardTheme(color: AppColor.background),
      textTheme: TextTheme(display1: TextStyle(color: AppColor.black)),
      iconTheme: IconThemeData(color: AppColor.iconColor),
      bottomAppBarColor: AppColor.background,
      dividerColor: AppColor.lightGrey,
      primaryTextTheme: TextTheme(
          body1: TextStyle(color:AppColor.titleTextColor)
      )
  );

  static TextStyle titleStyle = const TextStyle(color: AppColor.titleTextColor, fontSize: 16);
  static TextStyle subTitleStyle = const TextStyle(color: AppColor.subTitleTextColor, fontSize: 12);

  static TextStyle h1Style = const TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
  static TextStyle h2Style = const TextStyle(fontSize: 22);
  static TextStyle h3Style = const TextStyle(fontSize: 20);
  static TextStyle h4Style = const TextStyle(fontSize: 18);
  static TextStyle h5Style = const TextStyle(fontSize: 16);
  static TextStyle h6Style = const TextStyle(fontSize: 14);

  static List<BoxShadow> shadow =  <BoxShadow>[
    BoxShadow(color: Color(0xfff8f8f8), blurRadius: 10, spreadRadius: 15),
  ];


  static EdgeInsets padding = const EdgeInsets.symmetric(horizontal: 20, vertical: 10);
  static EdgeInsets hPadding = const EdgeInsets.symmetric(horizontal: 10,);

  static double fullWidth(BuildContext context){
    return MediaQuery.of(context).size.width;
  }
  static double fullHeight(BuildContext context){
    return MediaQuery.of(context).size.height;
  }
}