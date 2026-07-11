class AppEnv {
  static const String APP_ENV = String.fromEnvironment(
    'APP_ENV',
    defaultValue: '',
  );

  static const String API_URL = String.fromEnvironment(
    'API_URL',
    defaultValue: '',
  );

  static const String FISEBASE_ANDROID_API_KEY = String.fromEnvironment(
    'FISEBASE_ANDROID_API_KEY',
    defaultValue: '',
  );

  static const String FISEBASE_ANDROID_APP_ID = String.fromEnvironment(
    'FISEBASE_ANDROID_APP_ID',
    defaultValue: '',
  );

  static const String FIREBASE_MESSAGING_SENDER_ID = String.fromEnvironment(
    'FIREBASE_MESSAGING_SENDER_ID',
    defaultValue: '',
  );

  static const String FIREBASE_PROJECT_ID = String.fromEnvironment(
    'FIREBASE_PROJECT_ID',
    defaultValue: '',
  );

  static const String FIREBASE_STORAGE_BUCKET = String.fromEnvironment(
    'FIREBASE_STORAGE_BUCKET',
    defaultValue: '',
  );

  static const String FISEBASE_IOS_API_KEY = String.fromEnvironment(
    'FISEBASE_IOS_API_KEY',
    defaultValue: '',
  );

  static const String FISEBASE_IOS_APP_ID = String.fromEnvironment(
    'FISEBASE_IOS_APP_ID',
    defaultValue: '',
  );
}
