import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_wanandroid2/core/common/widgets/indicators/common_tips_view.dart';
import 'package:flutter_wanandroid2/core/res/media.dart';
import 'package:flutter_wanandroid2/l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:network/network.dart';

/// Default error view widget
/// give param error, display title, message and image
/// or provide title, message manually
class ErrorView extends StatelessWidget {
  /// Creates a new instance of [ErrorView]
  const ErrorView(
      {this.error,
      this.title,
      this.message,
      this.image,
      this.buttonText,
      this.buttonTitle,
      required this.onPressed,
      super.key});

  final Object? error;

  final String? title;
  final String? message;
  final Widget? image;
  final Widget? buttonText;
  final String? buttonTitle;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    final error = this.error as ServerException?;
    final defaultMessage = error?.message;
    String? defaultTitle;
    String? defaultButtonTitle = buttonText != null ? null : "retry";
    Widget defaultImage =
        const Icon(IconFonts.pageError, size: 100, color: Colors.grey);

    switch (error?.statusCode) {
      case ErrorType.notLogin:
        return UnAuthErrorView(
          image: Image.asset(
            Media.logo,
            width: 180.w,
            height: 180.w,
          ),
          onPressed: () => context.push("/login"),
          title: l10n.tips_not_login,
          buttonTitle: l10n.login,
        );
      case ErrorType.httpException:
        defaultTitle = "network error";
        defaultImage = Transform.translate(
          offset: const Offset(-50, 0),
          child: const Icon(IconFonts.pageNetworkError,
              size: 100, color: Colors.grey),
        );
      default:
        defaultTitle = "error";
    }
    return CommonTipsView(
      title: title ?? defaultTitle,
      message: message ?? defaultMessage,
      image: image ?? defaultImage,
      buttonText: buttonText,
      buttonTitle: buttonTitle ?? defaultButtonTitle,
      onPressed: onPressed,
    );
  }
}

class UnAuthErrorView extends StatelessWidget {
  final String title;
  final Widget image;
  final String buttonTitle;
  final VoidCallback onPressed;

  const UnAuthErrorView(
      {super.key,
      required this.title,
      required this.image,
      required this.buttonTitle,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return CommonTipsView(
      title: title,
      image: image,
      buttonTitle: buttonTitle,
      onPressed: onPressed,
    );
  }
}
