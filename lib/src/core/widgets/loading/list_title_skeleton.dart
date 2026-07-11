import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:flutter/material.dart';
import 'package:system_design_flutter/index.dart';

class ListTitleSkeleton extends StatelessWidget {
  const ListTitleSkeleton({
    super.key,
    this.withAvatar = true,
    this.withTrailing = false,
  });

  final bool withAvatar;
  final bool withTrailing;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.colorTheme.cardDefault,
        borderRadius: BorderRadius.all(Radius.circular(SdSpacing.s12)),
      ),
      padding: EdgeInsets.all(SdSpacing.s12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              if (withAvatar) ...[
                SdSkeleton(
                  width: SdSpacing.s40,
                  height: SdSpacing.s40,
                  borderRadiusValue: SdSpacing.s100,
                ),
                SdHorizontalSpacing(),
              ],
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SdSkeleton(width: 100),
                  SdVerticalSpacing(xRatio: 0.5),
                  SdSkeleton(width: 150),
                ],
              ),
            ],
          ),
          if (withTrailing) ...[
            SdSkeleton(
              width: SdSpacing.s20,
              height: SdSpacing.s20,
              borderRadiusValue: SdSpacing.s100,
            ),
          ],
        ],
      ),
    );
  }
}
