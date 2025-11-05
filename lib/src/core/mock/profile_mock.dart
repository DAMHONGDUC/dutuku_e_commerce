import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:dutuku_e_commerce/src/domain/domain.dart';
import 'package:flutter/material.dart';

class ProfileMock {
  static final listGeneralSetting = [
    SettingItemEntity(
      name: SettingItemType.editProfile.label,
      iconData: Icons.person_outline,
      iconColor: Colors.blueAccent,
      itemType: SettingItemType.editProfile,
    ),
    SettingItemEntity(
      name: SettingItemType.changePassword.label,
      iconData: Icons.lock_outline,
      iconColor: Colors.orangeAccent,
      itemType: SettingItemType.changePassword,
    ),
    SettingItemEntity(
      name: SettingItemType.notifications.label,
      iconData: Icons.notifications_none_outlined,
      iconColor: Colors.purpleAccent,
      itemType: SettingItemType.notifications,
    ),
    SettingItemEntity(
      name: SettingItemType.security.label,
      iconData: Icons.shield_outlined,
      iconColor: Colors.redAccent,
      itemType: SettingItemType.security,
    ),
    SettingItemEntity(
      name: SettingItemType.language.label,
      iconData: Icons.language_outlined,
      iconColor: Colors.green,
      itemType: SettingItemType.language,
    ),
    SettingItemEntity(
      name: SettingItemType.theme.label,
      iconData: Icons.dark_mode_outlined,
      iconColor: Colors.teal,
      itemType: SettingItemType.theme,
    ),
    SettingItemEntity(
      name: SettingItemType.privacy.label,
      iconData: Icons.privacy_tip_outlined,
      iconColor: Colors.indigo,
      itemType: SettingItemType.privacy,
    ),
  ];

  static final listPreferencesSetting = [
    SettingItemEntity(
      name: SettingItemType.dataSaver.label,
      iconData: Icons.data_saver_off_outlined,
      iconColor: Colors.cyan,
      itemType: SettingItemType.dataSaver,
    ),
    SettingItemEntity(
      name: SettingItemType.legalAndPolicies.label,
      iconData: Icons.description_outlined,
      iconColor: Colors.teal,
      itemType: SettingItemType.legalAndPolicies,
    ),
    SettingItemEntity(
      name: SettingItemType.helpAndSupport.label,
      iconData: Icons.support_agent_outlined,
      iconColor: Colors.deepPurpleAccent,
      itemType: SettingItemType.helpAndSupport,
    ),
  ];

  static final listAppSetting = [
    SettingItemEntity(
      name: SettingItemType.aboutApp.label,
      iconData: Icons.info_outline,
      iconColor: Colors.blueGrey,
      itemType: SettingItemType.aboutApp,
    ),
    SettingItemEntity(
      name: SettingItemType.rateApp.label,
      iconData: Icons.star_border,
      iconColor: Colors.amber,
      itemType: SettingItemType.rateApp,
    ),
    SettingItemEntity(
      name: SettingItemType.sendFeedback.label,
      iconData: Icons.feedback_outlined,
      iconColor: Colors.lightBlueAccent,
      itemType: SettingItemType.sendFeedback,
    ),
    SettingItemEntity(
      name: SettingItemType.logout.label,
      iconData: Icons.logout_outlined,
      iconColor: Colors.red,
      itemType: SettingItemType.logout,
      nameColor: Colors.red,
    ),
  ];

  static final listSettingSection = [
    SettingSectionEntity(
      name: SettingSectionType.general.label,
      items: listGeneralSetting,
      sectionType: SettingSectionType.general,
    ),
    SettingSectionEntity(
      name: SettingSectionType.preferences.label,
      items: listPreferencesSetting,
      sectionType: SettingSectionType.preferences,
    ),
    SettingSectionEntity(
      name: SettingSectionType.app.label,
      items: listAppSetting,
      sectionType: SettingSectionType.app,
    ),
  ];
}
