import 'package:dutuku_e_commerce/src/domain/domain.dart';
import 'package:dutuku_e_commerce/src/presentation/profile/components/setting_card.dart';
import 'package:flutter/material.dart';
import 'package:system_design_flutter/index.dart';

class SettingSection extends StatelessWidget {
  const SettingSection({super.key, required this.settingSection});
  final SettingSectionEntity settingSection;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(settingSection.name, style: SdTextStyle.heading16()),
        SdVerticalSpacing(),
        SdListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          items: settingSection.items,
          separatorBuilder: (_, index) {
            return SdVerticalSpacing();
          },
          itemBuilder: (_, index) {
            return SettingCard(setting: settingSection.items[index]);
          },
        ),
      ],
    );
  }
}
