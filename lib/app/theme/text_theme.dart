import 'package:flutter/material.dart';

TextTheme buildTextTheme(Color color) {
  return TextTheme(
    labelSmall: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: color.withOpacity(0.5),
    ),
  );
}
