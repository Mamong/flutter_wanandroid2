import 'package:flutter/material.dart';

abstract class Media {
  const Media();

  /// base urls
  static const _baseImage = 'assets/images';
  static const _baseSplash = 'assets/splash';
  static const _baseOnBoarding = 'assets/on_boarding';

  static const logo = '$_baseImage/logo.jpg';

  /// splash
  static const splashAndroid = '$_baseSplash/splash_android.png';
  static const splashBg = '$_baseSplash/splash_bg.png';
  static const splashBgDark = '$_baseSplash/splash_bg_dark.png';
  static const splashFlutter = '$_baseSplash/splash_flutter.png';
  static const splashFun = '$_baseSplash/splash_fun.png';

  /// on boarding
  static const onBoardingOne = '$_baseOnBoarding/1.png';
  static const onBoardingTwo = '$_baseOnBoarding/2.png';
}

class IconFonts {
  IconFonts._();

  static const String fontFamily = 'iconfont';

  static const IconData pageEmpty = IconData(0xe63c, fontFamily: fontFamily);
  static const IconData pageError = IconData(0xe600, fontFamily: fontFamily);
  static const IconData pageNetworkError =
      IconData(0xe678, fontFamily: fontFamily);
  static const IconData pageUnAuth = IconData(0xe65f, fontFamily: fontFamily);
}
