// widgets/color_selection_section.dart
import 'package:dutuku_e_commerce/src/core/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:dutuku_e_commerce/src/domain/entities/product/product_color.dart';
import 'package:system_design_flutter/index.dart';

class ColorSelectionSection extends StatelessWidget {
  final List<ProductColor> productColors;
  final int selectedIndex;
  final Function(int) onColorSelected;

  const ColorSelectionSection({
    super.key,
    required this.productColors,
    required this.selectedIndex,
    required this.onColorSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: SdSpacing.s16,
        vertical: SdSpacing.s12,
      ),
      color: context.colorTheme.surfaceDefault,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Color', style: SdTextStyle.heading18()),
          SdVerticalSpacing(),
          Row(
            children: productColors.asMap().entries.map((entry) {
              int index = entry.key;
              ProductColor productColor = entry.value;

              return GestureDetector(
                onTap: () => onColorSelected(index),
                child: Container(
                  margin: const EdgeInsets.only(right: SdSpacing.s12),
                  child: _ColorOption(
                    productColor: productColor,
                    isSelected: index == selectedIndex,
                  ),
                ),
              );
            }).toList(),
          ),
          SdVerticalSpacing(),
          if (selectedIndex < productColors.length)
            Text(
              'Selected: ${productColors[selectedIndex].colorName}',
              style: SdTextStyle.body16().copyWith(
                color: context.colorTheme.textSubTitle,
              ),
            ),
        ],
      ),
    );
  }
}

class _ColorOption extends StatelessWidget {
  const _ColorOption({
    required this.isSelected,
    required this.productColor,
  });
  final bool isSelected;
  final ProductColor productColor;

  @override
  Widget build(BuildContext context) {
    final color = SdColorHelper.getColorFromHex(productColor.colorCode);

    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
        border: Border.all(
          color: isSelected ? Colors.black87 : Colors.transparent,
          width: SdSpacing.s2,
        ),
        boxShadow: [
          BoxShadow(
            color: context.colorTheme.boxShadowDefault,
            spreadRadius: SdSpacing.s1,
            blurRadius: SdSpacing.s4,
            offset: const Offset(0, SdSpacing.s2),
          ),
        ],
      ),
      child: isSelected
          ? SdIcon(
              iconData: Icons.check,
              color: SdColorHelper.getContrastColor(color),
            )
          : null,
    );
  }
}
