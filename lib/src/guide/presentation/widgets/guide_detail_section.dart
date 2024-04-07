import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:flutter_wanandroid2/core/res/styles/colors.dart';
import 'package:flutter_wanandroid2/src/guide/presentation/widgets/guide_detail_button.dart';
import 'package:flutter_wanandroid2/src/guide/domain/entities/navi.dart';

class GuideDetailSection extends StatelessWidget {
  const GuideDetailSection({super.key, required this.section});

  final Navi section;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(30.w))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            section.name,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colours.MAIN_TEXT,
                fontSize: 32.w,
                fontWeight: FontWeight.bold),
          ),
          Gap(20.w),
          Wrap(
            spacing: 15.w,
            runSpacing: 20.w,
            children: section.articles
                .map((e) => GuideDetailButton(article: e))
                .toList(),
          ),
        ],
      ),
    );
  }
}
