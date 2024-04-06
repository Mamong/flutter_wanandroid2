import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LabelButton extends StatelessWidget {
  const LabelButton(
      {super.key, required this.title, required this.color, this.onTap});

  final String title;
  final Color color;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Ink(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(30.w)),
                color: color),
            child: InkWell(
                borderRadius: BorderRadius.all(Radius.circular(30.w)),
                onTap: onTap,
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 30.w, vertical: 6.w),
                  child: Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28.w,
                    ),
                  ),
                ))));
  }
}
