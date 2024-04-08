import 'package:flutter/material.dart';

abstract class TextStyles {
  /// weight: w700
  ///
  /// size: 48
  ///
  /// height: 2.4 >> 57.6px
  static const TextStyle headingBold = TextStyle(
    fontSize: 48,
    fontWeight: FontWeight.w700, // bold
    height: 1.2, // 57.6px
  );

  /// weight: w400
  ///
  /// size: 16
  ///
  /// height: 1.5 >> 24px
  static const TextStyle paragraphSubTextRegular1 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400, // regular
    height: 1.5, // 24px
  );

  /// weight: w600
  ///
  /// size: 20
  ///
  /// height: 1.5 >> 30px
  static const TextStyle buttonTextHeadingSemiBold = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600, // semi bold
    height: 1.5, // 30px
  );
}
