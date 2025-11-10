import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:flutter/material.dart';
import 'package:system_design_flutter/index.dart';

class NotificationsSkeleton extends StatelessWidget {
  const NotificationsSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return SdListView(
      padding: EdgeInsets.all(SdSpacing.s16),
      items: List.generate(10, (e) => e),
      separatorBuilder: (context, index) {
        return SdVerticalSpacing();
      },
      itemBuilder: (_, index) {
        return ListTitleSkeleton();
      },
    );
  }
}
