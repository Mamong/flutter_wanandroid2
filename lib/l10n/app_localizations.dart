import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_zh.dart';

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('zh'),
    Locale('zh', 'CN'),
    Locale('zh', 'HK')
  ];

  /// No description provided for @audioBottomNavigationBarItemLabel.
  ///
  /// In en, this message translates to:
  /// **'Audio'**
  String get audioBottomNavigationBarItemLabel;

  /// No description provided for @videoBottomNavigationBarItemLabel.
  ///
  /// In en, this message translates to:
  /// **'Video'**
  String get videoBottomNavigationBarItemLabel;

  /// No description provided for @profileBottomNavigationBarItemLabel.
  ///
  /// In en, this message translates to:
  /// **'Mine'**
  String get profileBottomNavigationBarItemLabel;

  /// No description provided for @tips_login.
  ///
  /// In en, this message translates to:
  /// **'Please login first'**
  String get tips_login;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @search_placeholder.
  ///
  /// In en, this message translates to:
  /// **'Search for more dry goods'**
  String get search_placeholder;

  /// No description provided for @search_hotkey.
  ///
  /// In en, this message translates to:
  /// **'Popular search'**
  String get search_hotkey;

  /// No description provided for @tips_search_keywords.
  ///
  /// In en, this message translates to:
  /// **'Please enter search keywords'**
  String get tips_search_keywords;

  /// No description provided for @menu_about.
  ///
  /// In en, this message translates to:
  /// **'About author'**
  String get menu_about;

  /// No description provided for @about_desc.
  ///
  /// In en, this message translates to:
  /// **'wanAndroid client based on Facebook react native'**
  String get about_desc;

  /// No description provided for @about_email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get about_email;

  /// No description provided for @about_bottom.
  ///
  /// In en, this message translates to:
  /// **'This project is for learning purposes only, not for commercial purposes'**
  String get about_bottom;

  /// No description provided for @menu_points_details.
  ///
  /// In en, this message translates to:
  /// **'Points details'**
  String get menu_points_details;

  /// No description provided for @points_rule.
  ///
  /// In en, this message translates to:
  /// **'Points rule'**
  String get points_rule;

  /// No description provided for @points_rank.
  ///
  /// In en, this message translates to:
  /// **'rank'**
  String get points_rank;

  /// No description provided for @points_level.
  ///
  /// In en, this message translates to:
  /// **'level'**
  String get points_level;

  /// No description provided for @points_point.
  ///
  /// In en, this message translates to:
  /// **'point'**
  String get points_point;

  /// No description provided for @menu_collection.
  ///
  /// In en, this message translates to:
  /// **'My collection'**
  String get menu_collection;

  /// No description provided for @menu_points.
  ///
  /// In en, this message translates to:
  /// **'My points'**
  String get menu_points;

  /// No description provided for @menu_websites.
  ///
  /// In en, this message translates to:
  /// **'Frequently used websites'**
  String get menu_websites;

  /// No description provided for @menu_theme.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get menu_theme;

  /// No description provided for @menu_share.
  ///
  /// In en, this message translates to:
  /// **'Share'**
  String get menu_share;

  /// No description provided for @menu_settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get menu_settings;

  /// No description provided for @menu_logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get menu_logout;

  /// No description provided for @share_app_desc.
  ///
  /// In en, this message translates to:
  /// **'Share WanAndroid application developed with react native, Click to download:{url}'**
  String share_app_desc(Object url);

  /// No description provided for @tips.
  ///
  /// In en, this message translates to:
  /// **'Tips'**
  String get tips;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// No description provided for @logout_confirm.
  ///
  /// In en, this message translates to:
  /// **'Are you sure to log out'**
  String get logout_confirm;

  /// No description provided for @tips_not_login.
  ///
  /// In en, this message translates to:
  /// **'Not logged in'**
  String get tips_not_login;

  /// No description provided for @tips_username_empty.
  ///
  /// In en, this message translates to:
  /// **'User name cannot be empty'**
  String get tips_username_empty;

  /// No description provided for @tips_pwd_empty.
  ///
  /// In en, this message translates to:
  /// **'Password cannot be empty'**
  String get tips_pwd_empty;

  /// No description provided for @tips_pwd_confirm_empty.
  ///
  /// In en, this message translates to:
  /// **'Confirm password cannot be empty'**
  String get tips_pwd_confirm_empty;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Log In'**
  String get login;

  /// No description provided for @login_userName.
  ///
  /// In en, this message translates to:
  /// **'User name'**
  String get login_userName;

  /// No description provided for @login_pwd.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get login_pwd;

  /// No description provided for @login_to_register.
  ///
  /// In en, this message translates to:
  /// **'New users? To '**
  String get login_to_register;

  /// No description provided for @login_success.
  ///
  /// In en, this message translates to:
  /// **'Login success!'**
  String get login_success;

  /// No description provided for @register_to_login.
  ///
  /// In en, this message translates to:
  /// **'Have an account? To'**
  String get register_to_login;

  /// No description provided for @register.
  ///
  /// In en, this message translates to:
  /// **'register'**
  String get register;

  /// No description provided for @register_confirm_pwd.
  ///
  /// In en, this message translates to:
  /// **'Confirm password'**
  String get register_confirm_pwd;

  /// No description provided for @footer_load_more.
  ///
  /// In en, this message translates to:
  /// **'Playing with life loading...'**
  String get footer_load_more;

  /// No description provided for @tab_navigation.
  ///
  /// In en, this message translates to:
  /// **'Navigation'**
  String get tab_navigation;

  /// No description provided for @tab_home.
  ///
  /// In en, this message translates to:
  /// **'WanAndroid'**
  String get tab_home;

  /// No description provided for @tab_project.
  ///
  /// In en, this message translates to:
  /// **'Project'**
  String get tab_project;

  /// No description provided for @tab_hierarchy.
  ///
  /// In en, this message translates to:
  /// **'Hierarchy'**
  String get tab_hierarchy;

  /// No description provided for @tab_public_account.
  ///
  /// In en, this message translates to:
  /// **'PublicAccount'**
  String get tab_public_account;

  /// No description provided for @loading.
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get loading;

  /// No description provided for @tips_collected.
  ///
  /// In en, this message translates to:
  /// **'Have been collected'**
  String get tips_collected;

  /// No description provided for @article.
  ///
  /// In en, this message translates to:
  /// **'Article'**
  String get article;

  /// No description provided for @menu_home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get menu_home;

  /// No description provided for @footer_no_more.
  ///
  /// In en, this message translates to:
  /// **'All loaded'**
  String get footer_no_more;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'zh'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {

  // Lookup logic when language+country codes are specified.
  switch (locale.languageCode) {
    case 'zh': {
  switch (locale.countryCode) {
    case 'CN': return AppLocalizationsZhCn();
case 'HK': return AppLocalizationsZhHk();
   }
  break;
   }
  }

  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'zh': return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
