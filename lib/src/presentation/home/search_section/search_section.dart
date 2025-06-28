import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:flutter/material.dart';
import 'package:system_design_flutter/index.dart';

import '../search_screen/search_screen.dart';

class SearchSection extends StatelessWidget {
  const SearchSection({super.key});

  void _navigateToSearch(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const SearchScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _navigateToSearch(context),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: SdSpacing.s16,
          vertical: SdSpacing.s12,
        ),
        decoration: BoxDecoration(
          color: context.colorTheme.cardDefault,
          borderRadius: BorderRadius.circular(SdSpacing.s12),
          border: Border.all(
            color: context.colorTheme.borderDefault,
            width: 1.2,
          ),
        ),
        child: Row(
          children: [
            const Icon(Icons.search, color: Colors.grey),
            const SizedBox(width: 12),
            Text(
              'Search products...',
              style: TextStyle(color: Colors.grey[600], fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
