import 'package:flutter/material.dart';

extension ThemeExtensions on BuildContext {
  ThemeData get themeData => Theme.of(this);
}