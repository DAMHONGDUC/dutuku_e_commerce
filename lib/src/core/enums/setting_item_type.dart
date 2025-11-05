enum SettingItemType {
  editProfile,
  changePassword,
  notifications,
  security,
  language,
  legalAndPolicies,
  helpAndSupport,
  logout,
}

extension SettingItemTypeExt on SettingItemType {
  String get label {
    switch (this) {
      case SettingItemType.editProfile:
        return 'Edit Profile';
      case SettingItemType.changePassword:
        return 'Change Password';
      case SettingItemType.notifications:
        return 'Notifications';
      case SettingItemType.security:
        return 'Security';
      case SettingItemType.language:
        return 'Language';
      case SettingItemType.legalAndPolicies:
        return 'Legal & Policies';
      case SettingItemType.helpAndSupport:
        return 'Help & Support';
      case SettingItemType.logout:
        return 'Logout';
    }
  }
}
