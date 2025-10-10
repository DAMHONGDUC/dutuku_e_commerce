import 'package:dutuku_e_commerce/src/core/resources/resources.dart';
import 'package:dutuku_e_commerce/src/presentation/product_detail/color_selection_section/color_selection_controller.dart';
import 'package:flutter/material.dart';
import 'package:dutuku_e_commerce/src/domain/entities/product/product_color.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system_design_flutter/index.dart';

const _kColorOptionSize = 45.0;

class ColorSelectionSection extends StatelessWidget {
  final List<ProductColor> productColors;

  const ColorSelectionSection({super.key, required this.productColors});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: SdHelper.getPageDefaultPadding(),
      color: context.colorTheme.surfaceDefault,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Color', style: SdTextStyle.heading18()),
          SdVerticalSpacing(),
          BlocBuilder<ColorSelectionController, ColorSelectionState>(
            buildWhen: (previous, current) {
              return current is ColorSelectionChangedColorState;
            },
            builder: (context, state) {
              if (state is ColorSelectionChangedColorState) {
                return SizedBox(
                  height: _kColorOptionSize,
                  child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: productColors.length,
                    separatorBuilder: (context, index) =>
                        SizedBox(width: SdSpacing.s12),
                    itemBuilder: (context, index) {
                      final productColor = productColors[index];

                      return GestureDetector(
                        onTap: () {
                          if (productColor.colorCode !=
                              state.productColor.colorCode) {
                            context
                                .read<ColorSelectionController>()
                                .onChangeColor(productColor);
                          }
                        },
                        child: _ColorOption(
                          productColor: productColor,
                          isSelected:
                              productColor.colorCode ==
                              state.productColor.colorCode,
                        ),
                      );
                    },
                  ),
                );
              }

              return SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }
}

class _ColorOption extends StatelessWidget {
  const _ColorOption({required this.isSelected, required this.productColor});
  final bool isSelected;
  final ProductColor productColor;

  @override
  Widget build(BuildContext context) {
    final color = SdColorHelper.getColorFromHex(productColor.colorCode);

    return Container(
      width: _kColorOptionSize,
      height: _kColorOptionSize,
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
