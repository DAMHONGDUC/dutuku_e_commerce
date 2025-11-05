enum SettingSectionType { general, preferences, app }

extension SettingSectionTypeExt on SettingSectionType {
  String get label {
    switch (this) {
      case SettingSectionType.general:
        return 'General';
      case SettingSectionType.preferences:
        return 'Preferences';
      case SettingSectionType.app:
        return 'App';
    }
  }
}
