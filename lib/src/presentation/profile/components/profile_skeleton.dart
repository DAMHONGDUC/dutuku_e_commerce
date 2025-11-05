import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:flutter/material.dart';
import 'package:system_design_flutter/index.dart';

class ProfileSkeleton extends StatelessWidget {
  const ProfileSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return SdListView(
      padding: EdgeInsets.all(SdSpacing.s16),
      items: List.generate(10, (e) => e),
      separatorBuilder: (context, index) {
        return SdVerticalSpacing();
      },
      itemBuilder: (_, index) {
        return Container(
          decoration: BoxDecoration(
            color: context.colorTheme.cardDefault,
            borderRadius: BorderRadius.all(Radius.circular(SdSpacing.s12)),
          ),
          padding: EdgeInsets.all(SdSpacing.s12),
          child: Row(
            children: [
              SdSkeleton(
                width: SdSpacing.s40,
                height: SdSpacing.s40,
                borderRadiusValue: SdSpacing.s100,
              ),
              SdHorizontalSpacing(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SdSkeleton(width: 50),
                  SdVerticalSpacing(xRatio: 0.5),
                  SdSkeleton(width: 100),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
