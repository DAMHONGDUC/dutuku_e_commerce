import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:flutter/material.dart';
import 'package:system_design_flutter/index.dart';

class MyOrderSkeleton extends StatelessWidget {
  const MyOrderSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return SdListView(
      padding: EdgeInsets.all(SdSpacing.s10),
      itemBuilder: (context, index) {
        return _MyOrderCardSkeleton();
      },
      separatorBuilder: (_, __) => SdVerticalSpacing(value: SdSpacing.s10),
      items: List.generate(10, (e) => e),
    );
  }
}

class _MyOrderCardSkeleton extends StatelessWidget {
  const _MyOrderCardSkeleton();

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
              SdSkeleton(width: 50),
              SdVerticalSpacing(xRatio: 0.5),
              SdSkeleton(width: 100),
              SdVerticalSpacing(xRatio: 0.5),
              SdSkeleton(width: 200),
            ],
          ),
        ],
      ),
    );
  }
}
