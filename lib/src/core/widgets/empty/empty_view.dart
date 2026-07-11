import 'package:dutuku_e_commerce/src/core/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:system_design_flutter/index.dart';

class EmptyView extends StatelessWidget {
  final String message;
  final String? iconPath;
  final double iconSize;

  const EmptyView({
    super.key,
    this.message = 'No data available',
    this.iconPath = 'assets/icons/ic_empty_box.png',
    this.iconSize = SdSpacing.s100,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SdIcon(iconPath: iconPath!, iconSize: iconSize),
          SdVerticalSpacing(),
          Text(
            message,
            style: SdTextStyle.body14().wColor(context.colorTheme.textSubTitle),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
