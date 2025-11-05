enum SettingSection { general, preferences }

extension SettingSectionExt on SettingSection {
  String get label {
    switch (this) {
      case SettingSection.general:
        return 'General';
      case SettingSection.preferences:
        return 'Preferences';
    }
  }
}
