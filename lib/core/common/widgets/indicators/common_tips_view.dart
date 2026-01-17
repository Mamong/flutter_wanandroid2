import 'package:flutter/material.dart';
import 'package:flutter_wanandroid2/core/res/media.dart';

class CommonTipsView extends StatelessWidget {
  const CommonTipsView(
      {this.title,
      this.message,
      this.image,
      this.buttonText,
      this.buttonTitle,
      this.onPressed,
      super.key});

  final String? title;
  final String? message;
  final Widget? image;
  final Widget? buttonText;
  final String? buttonTitle;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    var titleStyle =
        Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.grey);
    var messageStyle = titleStyle?.copyWith(
        color: titleStyle.color?.withValues(alpha: 0.7), fontSize: 14);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        image ?? Icon(IconFonts.pageError, size: 80, color: Colors.grey[500]),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              if (title != null)
                Text(
                  title!,
                  style: titleStyle,
                ),
              const SizedBox(height: 20),
              if (message != null)
                ConstrainedBox(
                  constraints:
                      const BoxConstraints(maxHeight: 200, minHeight: 150),
                  child: SingleChildScrollView(
                    child: Text(message!, style: messageStyle),
                  ),
                ),
            ],
          ),
        ),
        Center(
          child: TipsActionButton(
            title: buttonTitle,
            onPressed: onPressed,
            child: buttonText,
          ),
        ),
      ],
    );
  }
}

class TipsActionButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget? child;
  final String? title;

  const TipsActionButton({super.key, this.onPressed, this.child, this.title})
      : assert(child == null || title == null);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.grey,
      ),
      onPressed: onPressed,
      child: child ??
          Text(
            title ?? "retry",
          ),
    );
  }
}
