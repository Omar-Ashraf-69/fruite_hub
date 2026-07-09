class FlavorsConfig {
  static const String flavor = String.fromEnvironment('FLAVOR');

  static bool get isDevelopment => flavor == 'dev';
  static bool get isProduction => flavor == 'prod';
}
