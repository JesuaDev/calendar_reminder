import 'package:flutter/material.dart';

extension ColorSchemeExtension on BuildContext {
  ColorScheme get themeColor => Theme.of(this).colorScheme;
}
