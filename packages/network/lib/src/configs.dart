/// Http level configuration variables
class Configs {
  /// The max allowed age duration for the http memory cache
  static const Duration maxCacheAge = Duration(hours: 1);

  /// The max allowed age duration for the http disk cache
  static const Duration maxDiskCacheAge = Duration(days: 7);

  /// The max allowed count for the http disk cache
  static const int maxMemoryCacheCount = 100;

  /// Key used in dio options to indicate whether
  /// cache should be force refreshed
  static const String dioCacheForceRefreshKey = 'dio_cache_force_refresh_key';
  static const String dioTokenKey = 'dio_token_key';

  /// Base API URL of The WanAndroid
  static const String apiBaseUrl = 'https://www.wanandroid.com';


  static const String defaultLanguage = 'zh';
  static const String defaultTheme = 'dark';
  static const int defaultThemeColor = 0x2196F3FF;

}