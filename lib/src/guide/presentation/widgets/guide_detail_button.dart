import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_wanandroid2/core/utils/constants/constants.dart';
import 'package:flutter_wanandroid2/src/article/domain/entities/article.dart';

class GuideDetailButton extends StatelessWidget {
  const GuideDetailButton({super.key, required this.article});

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Ink(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(30.w)),
                color: Constants.chapterBgColor[article.id % 10]),
            child: InkWell(
                borderRadius: BorderRadius.all(Radius.circular(30.w)),
                onTap: () {
                  context.push(Uri(path: "/webview", queryParameters: {
                    'title': article.title,
                    'url': article.link
                  }).toString());
                },
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 30.w, vertical: 6.w),
                  child: Text(
                    article.title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28.w,
                    ),
                  ),
                ))));
  }
}
