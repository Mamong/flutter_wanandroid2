import 'package:flutter/material.dart';

abstract class ButtonStyles {
  static ButtonStyle shrinkIconButton(Size size) => IconButton.styleFrom(
        minimumSize: size,
        padding: EdgeInsets.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      );
}
