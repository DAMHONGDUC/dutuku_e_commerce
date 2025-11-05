enum SettingSectionType { general, preferences }

extension SettingSectionTypeExt on SettingSectionType {
  String get label {
    switch (this) {
      case SettingSectionType.general:
        return 'General';
      case SettingSectionType.preferences:
        return 'Preferences';
    }
  }
}
