import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_wanandroid2/core/res/media.dart';
import 'package:flutter_wanandroid2/core/res/styles/colors.dart';
import 'package:flutter_wanandroid2/core/utils/constants/constants.dart';
import 'package:flutter_wanandroid2/l10n/app_localizations.dart';
import 'package:flutter_wanandroid2/src/about/presentation/widgets/about_linker_item.dart';
import 'package:gap/gap.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.menu_about),
      ),
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 28.w),
          child: Center(
              child: Column(
            children: [
              Gap(150.w),
              ClipOval(
                  child: Image.asset(
                Media.logo,
                width: 180.w,
                height: 180.w,
              )),
              Gap(20.w),
              Text(
                l10n.about_desc,
                style: TextStyle(color: Colours.MAIN_TEXT, fontSize: 30.w),
              ),
              Gap(100.w),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AboutLinkerItem(
                    title: l10n.about_email,
                    content: Constants.csdnStr,
                    isLink: false,
                  ),
                  Gap(50.w),
                  const AboutLinkerItem(
                    title: "CSDN",
                    content: Constants.csdnStr,
                  ),
                  Gap(50.w),
                  const AboutLinkerItem(
                    title: "GitHub",
                    content: Constants.gitHubStr,
                  ),
                ],
              ),
              const Spacer(),
              Text(
                l10n.about_bottom,
                style: TextStyle(color: Colours.MAIN_TEXT, fontSize: 26.w),
              ),
              Gap(50.w),
            ],
          ))),
    );
  }
}
