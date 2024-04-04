import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_wanandroid2/core/res/styles/colors.dart';
import 'package:flutter_wanandroid2/src/hierarchy/presentation/widgets/label_button.dart';
import 'package:flutter_wanandroid2/src/home/domain/entities/tree.dart';
import 'package:gap/gap.dart';

class HierarchySection extends StatelessWidget {
  const HierarchySection({super.key, required this.section});

  final Tree section;

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
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Wrap(
              spacing: 15.w, // 主轴(水平)方向间距
              runSpacing: 20.w, // 纵轴（垂直）方向间距
              children:
                  section.children.map((e) => LabelButton(item: e)).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
