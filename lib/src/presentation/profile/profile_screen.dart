import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:dutuku_e_commerce/src/domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:system_design_flutter/index.dart';

import 'components/profile_app_bar.dart';
import 'components/setting_card.dart';

final _generalList = [
  SettingEntity(
    name: SettingItemType.editProfile.label,
    iconData: Icons.person_outline,
    type: SettingItemType.editProfile,
  ),
  SettingEntity(
    name: SettingItemType.changePassword.label,
    iconData: Icons.lock_outline,
    type: SettingItemType.changePassword,
  ),
  SettingEntity(
    name: SettingItemType.notifications.label,
    iconData: Icons.notifications_none_outlined,
    type: SettingItemType.notifications,
  ),
  SettingEntity(
    name: SettingItemType.security.label,
    iconData: Icons.security_outlined,
    type: SettingItemType.security,
  ),
  SettingEntity(
    name: SettingItemType.language.label,
    iconData: Icons.security_outlined,
    type: SettingItemType.language,
  ),
];

final _preferencesList = [
  SettingEntity(
    name: SettingItemType.legalAndPolicies.label,
    iconData: Icons.document_scanner_outlined,
    type: SettingItemType.legalAndPolicies,
  ),
  SettingEntity(
    name: SettingItemType.helpAndSupport.label,
    iconData: Icons.help_outline,
    type: SettingItemType.helpAndSupport,
  ),
  SettingEntity(
    name: SettingItemType.logout.label,
    iconData: Icons.logout_outlined,
    type: SettingItemType.logout,
  ),
];

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  Future _onRefresh() async {}

  @override
  Widget build(BuildContext context) {
    return SdSafeAreaScaffold(
      backgroundColor: context.colorTheme.pageDefault,
      contentBgColor: context.colorTheme.pageDefault,
      appBar: ProfileAppBar(),
      child: RefreshWrapper(
        onRefresh: _onRefresh,
        child: ListView(
          padding: EdgeInsets.all(SdSpacing.s16),
          children: [
            Text('General', style: SdTextStyle.heading16()),
            SdVerticalSpacing(),
            SdListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              items: _generalList,
              separatorBuilder: (_, index) {
                return SdVerticalSpacing();
              },
              itemBuilder: (_, index) {
                return SettingCard(setting: _generalList[index]);
              },
            ),
            SdVerticalSpacing(xRatio: 2),
            Text('General', style: SdTextStyle.heading16()),
            SdVerticalSpacing(),
            SdListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              items: _preferencesList,
              separatorBuilder: (_, index) {
                return SdVerticalSpacing();
              },
              itemBuilder: (_, index) {
                return SettingCard(setting: _preferencesList[index]);
              },
            ),
          ],
        ),
      ),
    );
  }
}
