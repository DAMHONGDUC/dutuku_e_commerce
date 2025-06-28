import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
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
          horizontal: SdSpacing.s14,
          vertical: SdSpacing.s10,
        ),
        decoration: BoxDecoration(
          color: context.colorTheme.cardDefault,
          borderRadius: BorderRadius.circular(SdSpacing.s12),
          border: Border.all(
            color: context.colorTheme.borderDefault,
            width: SdSpacing.s1,
          ),
        ),
        child: Row(
          children: [
            SdIcon(
              iconData: Ionicons.search_outline,
              color: context.colorTheme.iconSecondary,
            ),
            SdHorizontalSpacing(),
            Text(
              'Search products...',
              style: context.textTheme.body12.wColor(
                context.colorTheme.textSubTitle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
