import 'package:flutter/material.dart';
import 'package:flutter_wanandroid2/core/utils/core_utils.dart';

abstract class Colours {

  static const Color mainText = Color(0xFF222222);
  static const Color textDark = Color(0xFF666666);
  static const Color textLight = Color(0xFF999999);
  // 页面中分割线颜色
  static const Color splitLine = Color(0xFFE8E8E8);
  // 所有页面背景颜色
  static const Color defaultBg = Color(0xFFf1f2f3);
  // 收藏颜色
  static const Color collect = Color(0xFFFA8072);
  // 金色
  static const Color gold = Color(0xFFFFD700);
  static const Color textTabInactive = Color(0xFFE6E6FA);

  static const Color wxGreen = Color(0xFF3CB371);
  static const Color iconGray = Color(0xFFE0E0E0);
  static const Color guideBg = Color(0xFFF8F8F8);

  // lightThemePrimaryTint Color Swatch
  static const Color lightThemePrimaryTint = Color(0xff9e9cdc);

  // lightThemePrimaryColor Color Swatch
  static const Color lightThemePrimaryColour = Color(0xff524eb7);

  // lightThemeSecondaryColor Color Swatch
  static const Color lightThemeSecondaryColour = Color(0xfff76631);

  // lightThemePrimaryTextColor Color Swatch
  static const Color lightThemePrimaryTextColour = Color(0xff282344);

  // lightThemeSecondaryTextColor Color Swatch
  static const Color lightThemeSecondaryTextColour = Color(0xff9491a1);

  // lightThemePinkColor Color Swatch
  static const Color lightThemePinkColour = Color(0xfff08e98);

  // lightThemeWhiteColor Color Swatch
  static const Color lightThemeWhiteColour = Color(0xffffffff);

  static Color classicAdaptiveTextColour(BuildContext context) =>
      CoreUtils.adaptiveColour(
        context,
        darkModeColour: Colours.lightThemeWhiteColour,
        lightModeColour: Colours.lightThemePrimaryTextColour,
      );
}