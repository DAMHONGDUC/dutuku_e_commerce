// widgets/color_selection_section.dart
import 'package:flutter/material.dart';
import 'package:dutuku_e_commerce/src/domain/entities/product/product_color.dart';

class ColorSelectionSection extends StatelessWidget {
  final List<ProductColor> productColors;
  final int selectedIndex;
  final Function(int) onColorSelected;
  final Color Function(String) hexToColor;

  const ColorSelectionSection({
    super.key,
    required this.productColors,
    required this.selectedIndex,
    required this.onColorSelected,
    required this.hexToColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Color',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: productColors.asMap().entries.map((entry) {
              int index = entry.key;
              ProductColor productColor = entry.value;

              return GestureDetector(
                onTap: () => onColorSelected(index),
                child: Container(
                  margin: const EdgeInsets.only(right: 12),
                  child: _buildColorOption(
                    productColor,
                    index == selectedIndex,
                  ),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 8),
          if (selectedIndex < productColors.length)
            Text(
              'Selected: ${productColors[selectedIndex].colorName}',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
                fontWeight: FontWeight.w500,
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildColorOption(ProductColor productColor, bool isSelected) {
    Color color;
    try {
      color = hexToColor(productColor.colorCode);
    } catch (e) {
      // Fallback color if hex parsing fails
      color = Colors.grey;
    }

    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
        border: Border.all(
          color: isSelected ? Colors.black87 : Colors.transparent,
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: isSelected
          ? Icon(Icons.check, color: _getContrastColor(color), size: 24)
          : null,
    );
  }

  Color _getContrastColor(Color color) {
    // Calculate luminance to determine if we should use white or black text
    final luminance =
        (0.299 * color.red + 0.587 * color.green + 0.114 * color.blue) / 255;
    return luminance > 0.5 ? Colors.black : Colors.white;
  }
}
