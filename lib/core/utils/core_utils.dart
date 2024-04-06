import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_wanandroid2/core/extensions/context_ext.dart';
import 'package:flutter_wanandroid2/core/extensions/textstyle_ext.dart';
import 'package:flutter_wanandroid2/core/res/styles/text.dart';
import 'package:flutter_wanandroid2/core/services/router.dart';

abstract class CoreUtils {
  const CoreUtils();

  static void showSnackBar(
    BuildContext context, {
    required String message,
    Color? backgroundColour,
  }) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      final snackBar = SnackBar(
        backgroundColor: backgroundColour ?? Theme.of(context).primaryColor,
        behavior: SnackBarBehavior.floating,
        content: Text(
          message,
          style: TextStyles.paragraphSubTextRegular1.white,
        ),
        duration: _calculateDuration(message),
      );

      ScaffoldMessenger.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(snackBar);
    });
  }

  static Duration _calculateDuration(String message) {
    // Average reading speed in words per minute
    const int averageWPM = 200;

    // Average word length in characters
    const int averageWordLength = 5;

    // Calculate milliseconds per character based on average reading speed
    const int millisecondsPerWord = (60 * 1000) ~/ averageWPM;
    const int millisecondsPerCharacter =
        millisecondsPerWord ~/ averageWordLength;

    // Calculate the duration based on the length of the message
    final int durationInMilliseconds =
        message.length * millisecondsPerCharacter;

    // Limit the duration to a reasonable maximum
    const int maxDurationMilliseconds = 5000; // 5 seconds
    final int finalDuration =
        durationInMilliseconds.clamp(1000, maxDurationMilliseconds);

    return Duration(milliseconds: finalDuration);
  }

  static void postFrameCall(VoidCallback callback) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      callback();
    });
  }

  static Color adaptiveColour(
    BuildContext context, {
    required Color lightModeColour,
    required Color darkModeColour,
  }) {
    return context.isDarkMode ? darkModeColour : lightModeColour;
  }

  static void rebuildAllChildren([BuildContext? context]) {
    void rebuild(Element el) {
      el.markNeedsBuild();
      el.visitChildren(rebuild);
    }

    ((context ?? rootNavigatorKey.currentContext!) as Element)
        .visitChildren(rebuild);
  }
}
