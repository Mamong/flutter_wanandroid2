import 'package:flutter/material.dart';
import 'package:flutter_wanandroid2/core/common/widgets/indicators/common_tips_view.dart';
import 'package:flutter_wanandroid2/core/res/media.dart';

class EmptyView extends StatelessWidget {
  const EmptyView(
      {super.key,
      this.title,
      this.message,
      this.image,
      this.buttonText,
      this.buttonTitle,
      required this.onPressed});

  final String? title;
  final String? message;
  final Widget? image;
  final Widget? buttonText;
  final String? buttonTitle;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    String? defaultButtonTitle = buttonText != null ? null : "refresh";

    return CommonTipsView(
      title: title,
      message: message ?? "has no data",
      image: image ??
          const Icon(IconFonts.pageEmpty, size: 100, color: Colors.grey),
      buttonText: buttonText,
      buttonTitle: buttonTitle ?? defaultButtonTitle,
      onPressed: onPressed,
    );
  }
}
