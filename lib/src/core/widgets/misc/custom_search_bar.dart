import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:system_design_flutter/index.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    super.key,
    this.height = 40.0,
    this.bgColor,
    this.hasBorder = true,
    this.searchIconSize = SdSpacing.s24,
  });
  final double height;
  final Color? bgColor;
  final bool hasBorder;
  final double searchIconSize;

  void _navigateToSearch(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _navigateToSearch(context),
      child: Container(
        height: height,
        padding: EdgeInsets.symmetric(
          horizontal: SdSpacing.s8,
          vertical: SdSpacing.s6,
        ),
        decoration: BoxDecoration(
          color: bgColor ?? context.colorTheme.cardDefault,
          borderRadius: BorderRadius.circular(SdSpacing.s8),
          border: hasBorder
              ? Border.all(
                  color: context.colorTheme.borderDefault,
                  width: SdSpacing.s1,
                )
              : null,
        ),
        child: Row(
          children: [
            SdIcon(
              iconData: Ionicons.search,
              color: context.colorTheme.iconDefault,
              iconSize: searchIconSize,
            ),
            SdHorizontalSpacing(),
            Text(
              'Search products...',
              style: context.textTheme.body14.wColor(
                context.colorTheme.textSubTitle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
