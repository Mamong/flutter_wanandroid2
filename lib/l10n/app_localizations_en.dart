// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get onBoardingSkip => 'Skip';

  @override
  String get onBoardingEnter => 'Get Started';

  @override
  String get tips_login => 'Please login first';

  @override
  String get language => 'Language';

  @override
  String get search_placeholder => 'Search for more dry goods';

  @override
  String get search_hotkey => 'Popular search';

  @override
  String get tips_search_keywords => 'Please enter search keywords';

  @override
  String get menu_about => 'About author';

  @override
  String get about_desc => 'wanAndroid client based on Google flutter';

  @override
  String get about_email => 'Email';

  @override
  String get about_bottom =>
      'This project is for learning purposes only, not for commercial purposes';

  @override
  String get menu_points_details => 'Points details';

  @override
  String get points_rule => 'Points rule';

  @override
  String get points_rank => 'rank';

  @override
  String get points_level => 'level';

  @override
  String get points_point => 'point';

  @override
  String get menu_collection => 'My collection';

  @override
  String get menu_points => 'My points';

  @override
  String get menu_websites => 'Frequently used websites';

  @override
  String get menu_theme => 'Theme';

  @override
  String get menu_share => 'Share';

  @override
  String get menu_settings => 'Settings';

  @override
  String get menu_logout => 'Logout';

  @override
  String share_app_desc(Object url) {
    return 'Share WanAndroid application developed with flutter, Click to download:$url';
  }

  @override
  String get tips => 'Tips';

  @override
  String get cancel => 'Cancel';

  @override
  String get confirm => 'Confirm';

  @override
  String get logout_confirm => 'Are you sure to log out';

  @override
  String get tips_not_login => 'Not logged in';

  @override
  String get tips_username_empty => 'User name cannot be empty';

  @override
  String get tips_pwd_empty => 'Password cannot be empty';

  @override
  String get tips_pwd_confirm_empty => 'Confirm password cannot be empty';

  @override
  String get login => 'Log In';

  @override
  String get login_userName => 'User name';

  @override
  String get login_pwd => 'Password';

  @override
  String get login_to_register => 'New users? To ';

  @override
  String get login_success => 'Login success!';

  @override
  String get register_to_login => 'Have an account? To ';

  @override
  String get register => 'register';

  @override
  String get register_confirm_pwd => 'Confirm password';

  @override
  String get footer_load_more => 'Playing with life loading...';

  @override
  String get tab_navigation => 'Navigation';

  @override
  String get tab_home => 'WanAndroid';

  @override
  String get tab_project => 'Project';

  @override
  String get tab_hierarchy => 'Hierarchy';

  @override
  String get tab_public_account => 'PublicAccount';

  @override
  String get loading => 'Loading...';

  @override
  String get tips_collected => 'Have been collected';

  @override
  String get article => 'Article';

  @override
  String get menu_home => 'Home';

  @override
  String get footer_no_more => 'All loaded';
}
