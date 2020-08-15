import 'package:flutter/material.dart';

class FloatingNavBarItem {
  final String title;
  final IconData icon;
  final Widget customWidget;

  FloatingNavBarItem({
    this.icon,
    @required this.title,
    this.customWidget = const SizedBox(),
  });
}
