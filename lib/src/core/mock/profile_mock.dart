import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:dutuku_e_commerce/src/domain/domain.dart';
import 'package:flutter/material.dart';

class ProfileMock {
  static final listGeneralSetting = [
    SettingItemEntity(
      name: SettingItemType.editProfile.label,
      iconData: Icons.person_outline,
      itemType: SettingItemType.editProfile,
    ),
    SettingItemEntity(
      name: SettingItemType.changePassword.label,
      iconData: Icons.lock_outline,
      itemType: SettingItemType.changePassword,
    ),
    SettingItemEntity(
      name: SettingItemType.notifications.label,
      iconData: Icons.notifications_none_outlined,
      itemType: SettingItemType.notifications,
    ),
    SettingItemEntity(
      name: SettingItemType.security.label,
      iconData: Icons.security_outlined,
      itemType: SettingItemType.security,
    ),
    SettingItemEntity(
      name: SettingItemType.language.label,
      iconData: Icons.security_outlined,
      itemType: SettingItemType.language,
    ),
  ];

  static final listPreferencesSetting = [
    SettingItemEntity(
      name: SettingItemType.legalAndPolicies.label,
      iconData: Icons.document_scanner_outlined,
      itemType: SettingItemType.legalAndPolicies,
    ),
    SettingItemEntity(
      name: SettingItemType.helpAndSupport.label,
      iconData: Icons.help_outline,
      itemType: SettingItemType.helpAndSupport,
    ),
    SettingItemEntity(
      name: SettingItemType.logout.label,
      iconData: Icons.logout_outlined,
      itemType: SettingItemType.logout,
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
  ];
}
