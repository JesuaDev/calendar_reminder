import 'package:flutter/material.dart';

extension SizeExtension on BuildContext {
  double get sizeW => MediaQuery.of(this).size.width;
  double get sizeH => MediaQuery.of(this).size.height;
}
