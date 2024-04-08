import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_wanandroid2/core/res/styles/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutLinkerItem extends StatefulWidget {
  const AboutLinkerItem({
    required this.title,
    required this.content,
    this.link,
    super.key,
  });

  final String title;
  final String content;
  final String? link;

  @override
  State<StatefulWidget> createState() => _AboutLinkerItemState();
}

class _AboutLinkerItemState extends State<AboutLinkerItem> {
  final TapGestureRecognizer tapGestureRecognizer = TapGestureRecognizer();

  @override
  void initState() {
    super.initState();
    tapGestureRecognizer.onTap = () {
      if (widget.link != null) launchUrl(Uri.parse(widget.link!));
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
                  decoration: widget.link != null
                      ? TextDecoration.underline
                      : TextDecoration.none,
                  decorationColor: themeColor),
              recognizer: widget.link != null ? tapGestureRecognizer : null),
        ]));
  }
}
