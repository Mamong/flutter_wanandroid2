import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_wanandroid2/core/res/styles/colors.dart';
import 'package:go_router/go_router.dart';

class AboutLinkerItem extends StatefulWidget {
  const AboutLinkerItem({
    required this.title,
    required this.content,
    this.isLink = true,
    super.key,
  });

  final String title;
  final String content;
  final bool isLink;

  @override
  State<StatefulWidget> createState() => _AboutLinkerItemState();
}

class _AboutLinkerItemState extends State<AboutLinkerItem> {
  final TapGestureRecognizer tapGestureRecognizer = TapGestureRecognizer();

  @override
  void initState() {
    super.initState();
    tapGestureRecognizer.onTap = () {
      context.push(Uri(
              path: "/webview",
              queryParameters: {'title': widget.title, 'url': widget.content})
          .toString());
    };
  }

  @override
  void dispose() {
    tapGestureRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeColor = Theme.of(context).primaryColor;

    return RichText(
        text: TextSpan(
            style: TextStyle(color: Colours.MAIN_TEXT, fontSize: 30.w),
            children: [
          TextSpan(text: "${widget.title}："),
          TextSpan(
              text: widget.content,
              style: TextStyle(
                  color: themeColor,
                  decoration: widget.isLink
                      ? TextDecoration.underline
                      : TextDecoration.none,
                  decorationColor: themeColor),
              recognizer: widget.isLink ? tapGestureRecognizer : null),
        ]));
  }
}
