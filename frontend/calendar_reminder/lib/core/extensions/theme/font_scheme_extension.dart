import 'package:flutter/material.dart';

extension FontSchemeExtension on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;
}
