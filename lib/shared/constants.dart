import 'package:flutter/material.dart';

class Constants {
  static const EdgeInsets padding = EdgeInsets.all(16.0);
  static const Widget verticleSpacing = SizedBox(height: 16.0);
  static const Widget horizontalSpacing = SizedBox(width: 16.0);
  static Color? primary = Colors.blue[800];
  static BorderRadius radius = const BorderRadius.all(Radius.circular(16));
  static const TextStyle headlineStyle = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 18,
  );
  static const TextStyle textStyle = TextStyle(
    color: Colors.grey,
  );

  static const String loginPath = '';
  static const String registerPath = '';
}
