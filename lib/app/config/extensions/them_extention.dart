import 'package:flutter/material.dart';

extension ThemeExtensions on BuildContext {
  ThemeData get themeData => Theme.of(this);
}
extension CustomThemeExtension on ThemeData {
  Color get imageTint => brightness == Brightness.dark ? Colors.white : Colors.black;
}