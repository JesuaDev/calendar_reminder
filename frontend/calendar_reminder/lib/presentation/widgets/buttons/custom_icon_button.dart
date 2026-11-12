import 'package:calendar_reminder/core/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class CustomIconButton extends StatelessWidget {
  final double borderRadius;
  final dynamic icon;

  const CustomIconButton({super.key, this.borderRadius = 100, this.icon});

  @override
  Widget build(BuildContext context) {
    final bool isBorderRadius = borderRadius != 50;
    return InkWell(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          color: context.themeColor.onPrimary.withValues(alpha: .3),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        padding: EdgeInsetsDirectional.symmetric(
          vertical: 12,
          horizontal: isBorderRadius ? 12 : 15,
        ),
        child: HugeIcon(
          icon: icon ?? HugeIcons.strokeRoundedClean,
          color: context.themeColor.primary,
        ),
      ),
    );
  }
}
