import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:flutter/material.dart';
import 'package:system_design_flutter/index.dart';

class SectionContainer extends StatelessWidget {
  const SectionContainer({
    super.key,
    required this.child,
    this.titleWidget,
    this.topMargin = false,
    this.bottomMargin = false,
  });

  final Widget child;
  final Widget? titleWidget;
  final bool topMargin;
  final bool bottomMargin;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(SdSpacing.s12),
      margin: EdgeInsets.only(
        top: topMargin ? SdSpacing.s8 : 0,
        bottom: bottomMargin ? SdSpacing.s8 : 0,
      ),
      decoration: BoxDecoration(
        color: context.colorTheme.surfaceDefault,
        borderRadius: BorderRadius.all(Radius.circular(SdSpacing.s8)),
      ),
      child: Column(
        children: [
          titleWidget != null ? titleWidget! : SizedBox.shrink(),
          child,
        ],
      ),
    );
  }
}
