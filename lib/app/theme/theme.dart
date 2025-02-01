import 'package:build_shopping_list/app/theme/text_theme.dart';
import 'package:flutter/material.dart';

ThemeData buildTheme() {
  return ThemeData(
    colorSchemeSeed: Colors.orangeAccent,
    brightness: Brightness.dark,
    useMaterial3: true,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: buildTextTheme(Colors.white),
  );
}
