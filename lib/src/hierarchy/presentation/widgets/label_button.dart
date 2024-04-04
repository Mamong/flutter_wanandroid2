import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_wanandroid2/core/utils/constants/constants.dart';
import 'package:flutter_wanandroid2/src/home/domain/entities/tree.dart';
import 'package:go_router/go_router.dart';

class LabelButton extends StatelessWidget {
  const LabelButton({
    super.key,
    required this.item});

  // final int sectionId;
  final Tree item;

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Ink(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(30.w)),
                color: Constants.chapterBgColor[item.id % 10]),
            child: InkWell(
                borderRadius: BorderRadius.all(Radius.circular(30.w)),
                onTap: () {
                  context.push("/hierarchy/${item.parentChapterId}?cateId=${item.id}");
                },
                child: Padding(
                                  padding:
                  EdgeInsets.symmetric(horizontal: 30.w, vertical: 6.w),
                                  child: Text(
                item.name,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28.w,
                ),
                                  ),
                                ))));
  }
}
