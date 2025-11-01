import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:flutter/material.dart';
import 'package:system_design_flutter/index.dart';

class MyOrderCardSkeleton extends StatelessWidget {
  const MyOrderCardSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.colorTheme.cardDefault,
        borderRadius: BorderRadius.all(Radius.circular(SdSpacing.s10)),
      ),
      padding: EdgeInsets.all(SdSpacing.s12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SdSkeleton(width: 60, height: 60),
          SdHorizontalSpacing(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SdSkeleton(height: 18, width: 50),
              SdVerticalSpacing(xRatio: 0.5),
              SdSkeleton(height: 18, width: 100),
              SdVerticalSpacing(xRatio: 0.25),
              SdSkeleton(height: 18, width: 200),
            ],
          ),
        ],
      ),
    );
  }
}
