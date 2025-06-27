import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:flutter/material.dart';
import 'package:system_design_flutter/index.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final String? actionText;
  final VoidCallback? onActionTap;

  const SectionHeader({
    super.key,
    required this.title,
    this.actionText,
    this.onActionTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: context.textTheme.heading16),
            GestureDetector(
              onTap: onActionTap,
              child: Text(
                actionText ?? 'See All',
                style: context.textTheme.heading10.wColor(AppColors.primary),
              ),
            ),
          ],
        ),
        SdVerticalSpacing(xRatio: 0.5),
      ],
    );
  }
}
