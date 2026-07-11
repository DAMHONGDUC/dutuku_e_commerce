import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:flutter/material.dart';
import 'package:system_design_flutter/index.dart';

class TitleContentRow extends StatelessWidget {
  const TitleContentRow({
    super.key,
    required this.title,
    required this.content,
    this.titleStyle,
    this.contentStyle,
  });
  final String title;
  final String content;
  final TextStyle? titleStyle;
  final TextStyle? contentStyle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '$title: ',
          style:
              titleStyle ??
              SdTextStyle.body12().wColor(context.colorTheme.textSubTitle),
        ),
        Text(content, style: contentStyle ?? SdTextStyle.body12()),
      ],
    );
  }
}
