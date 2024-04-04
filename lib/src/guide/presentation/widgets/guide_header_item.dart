import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_wanandroid2/src/home/domain/entities/navi.dart';

class GuideHeaderItem extends StatelessWidget {
  const GuideHeaderItem({super.key, required this.section});

  final Navi section;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 98.w,
      decoration: const BoxDecoration(color: Colors.white),
      child: Center(child: Text(section.name)),
    );
  }
}
