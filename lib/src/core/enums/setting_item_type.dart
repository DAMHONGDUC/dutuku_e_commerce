enum SettingItemType {
  // General
  editProfile,
  changePassword,
  notifications,
  security,
  language,
  theme,
  privacy,

  // Preferences
  legalAndPolicies,
  helpAndSupport,
  dataSaver,

  // App
  aboutApp,
  rateApp,
  sendFeedback,
  logout,
}

extension SettingItemTypeExt on SettingItemType {
  String get label {
    switch (this) {
      // --- General ---
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
      case SettingItemType.theme:
        return 'Theme';
      case SettingItemType.privacy:
        return 'Privacy Settings';

      // --- Preferences ---
      case SettingItemType.legalAndPolicies:
        return 'Legal & Policies';
      case SettingItemType.helpAndSupport:
        return 'Help & Support';
      case SettingItemType.dataSaver:
        return 'Data Saver';

      // --- App ---
      case SettingItemType.aboutApp:
        return 'About App';
      case SettingItemType.rateApp:
        return 'Rate This App';
      case SettingItemType.sendFeedback:
        return 'Send Feedback';
      case SettingItemType.logout:
        return 'Logout';
    }
  }
}
