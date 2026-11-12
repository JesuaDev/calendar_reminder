import 'package:calendar_reminder/core/extensions/extensions.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final bool isFilled;
  final String hint;

  const CustomButton({super.key, this.isFilled = false, required this.hint});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        decoration: BoxDecoration(
          color: isFilled ? context.themeColor.primary : Colors.transparent,
          border: Border.all(
            width: 1,
            color: isFilled ? Colors.transparent : context.themeColor.primary,
          ),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Text(
          hint,
          style: context.textTheme.bodyLarge?.copyWith(
            color: isFilled ? Colors.white : context.themeColor.primary,
          ),
        ),
      ),
    );
  }
}
