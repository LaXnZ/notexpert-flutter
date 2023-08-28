import 'package:flutter/material.dart';
import 'package:notexpert/src/utils/theme/widgets_themes/text_theme.dart';

class CustomAppTheme {
  static ThemeData lightTheme = ThemeData(
      brightness: Brightness.light, textTheme: CustomTextTheme.lightTextTheme);
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    textTheme: CustomTextTheme.darkTextTheme,
  );
}
