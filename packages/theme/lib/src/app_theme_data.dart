import 'package:flutter/material.dart';
import 'package:theme/src/spacing.dart';

import 'font_size.dart';

const _dividerThemeData = DividerThemeData(
  space: 0,
);

// If the number of properties get too big, we can start grouping them in
// classes like Flutter does with TextTheme, ButtonTheme, etc, inside ThemeData.
abstract class AppThemeData {
  AppThemeData({this.primarySwatch});

  final Color? primarySwatch;

  // use for builtin material widget
  ThemeData get materialThemeData;

  ThemeMode get themeMode;

  // use for custom widget
  double screenMargin = Spacing.mediumLarge;

  double gridSpacing = Spacing.mediumLarge;

  double navBarTitleFontSize = FontSize.mediumLarge;

  Color get feedTitleColor;

  Color get feedDescColor;

  Color get feedEnColor;

  Color get feedZhColor;

  Color get feedFocusColor;

  Color get publisherNameColor;
  Color get publisherDescColor;

  Color get dividerColor;
}

class LightAppThemeData extends AppThemeData {
  LightAppThemeData({super.primarySwatch});

  @override
  ThemeData get materialThemeData => ThemeData(
        brightness: Brightness.light,
        //colorSchemeSeed: primarySwatch??Colors.blue,
        colorScheme: ColorScheme.fromSeed(
            seedColor: primarySwatch ?? Colors.blue,
            surface: const Color(0xfff1f2f3),
            error: Colors.red,
            onTertiary: Colors.orange),
        appBarTheme: AppBarTheme(
            backgroundColor: primarySwatch ?? Colors.blue,
            shadowColor: primarySwatch ?? Colors.blue,
            elevation: 1,
            foregroundColor: Colors.white),
        // drawerTheme: DrawerThemeData(
        //   backgroundColor: Colors.white,
        // ),
        //primarySwatch: (primarySwatch??Colors.black).toMaterialColor(),
        // primarySwatch: Colors.deepOrange.toMaterialColor(),
        dividerTheme: _dividerThemeData,
      );

  @override
  ThemeMode get themeMode => ThemeMode.light;

  @override
  Color get feedTitleColor => Colors.black87;

  @override
  Color get feedDescColor => Colors.black45;

  @override
  Color get feedEnColor => Colors.black87;

  @override
  Color get feedZhColor => Colors.black45;

  @override
  Color get feedFocusColor => Colors.green;

  @override
  Color get publisherNameColor => Colors.black87;

  @override
  Color get publisherDescColor => Colors.black45;

  @override
  Color get dividerColor => Colors.black12;
}

class DarkAppThemeData extends AppThemeData {
  DarkAppThemeData({super.primarySwatch});

  //final Color? primaryColor;
  //final Color? primarySwatch;

  @override
  ThemeData get materialThemeData => ThemeData(
        brightness: Brightness.dark,
        //colorSchemeSeed: primarySwatch??Colors.blue,
        //toggleableActiveColor: Colors.white,
        primarySwatch: (primarySwatch ?? Colors.white).toMaterialColor(),
        dividerTheme: _dividerThemeData,
      );

  @override
  ThemeMode get themeMode => ThemeMode.dark;

  @override
  Color get feedTitleColor => Colors.white54;

  @override
  Color get feedDescColor => Colors.white54;

  @override
  Color get feedEnColor => Colors.white54;

  @override
  Color get feedZhColor => Colors.white30;

  @override
  Color get feedFocusColor => Colors.green;

  @override
  Color get publisherNameColor => Colors.white54;

  @override
  Color get publisherDescColor => Colors.white54;

  @override
  Color get dividerColor => Colors.white54;
}

extension on Color {
  Map<int, Color> _toSwatch() => {
        50: withValues(alpha: 0.1),
        100: withValues(alpha: 0.2),
        200: withValues(alpha: 0.3),
        300: withValues(alpha: 0.4),
        400: withValues(alpha: 0.5),
        500: withValues(alpha: 0.6),
        600: withValues(alpha: 0.7),
        700: withValues(alpha: 0.8),
        800: withValues(alpha: 0.9),
        900: this,
      };

  MaterialColor toMaterialColor() => MaterialColor(
        toARGB32(),
        _toSwatch(),
      );
}
