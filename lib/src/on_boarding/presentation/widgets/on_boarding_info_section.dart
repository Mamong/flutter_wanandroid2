import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_wanandroid2/core/res/media.dart';
import 'package:flutter_wanandroid2/l10n/app_localizations.dart';
import 'package:flutter_wanandroid2/core/common/app_storage_service.dart';
import 'package:flutter_wanandroid2/core/common/widgets/rounded_button.dart';
import 'package:flutter_wanandroid2/core/res/styles/colors.dart';
import 'package:flutter_wanandroid2/core/res/styles/text.dart';
import 'package:flutter_wanandroid2/core/services/injection_container.dart';
import 'package:flutter_wanandroid2/core/utils/core_utils.dart';

class OnBoardingInfoSection extends StatelessWidget {
  const OnBoardingInfoSection.first({super.key}) : index = 1;

  const OnBoardingInfoSection.second({super.key}) : index = 2;

  final int index;

  @override
  Widget build(BuildContext context) {
    final adaptiveColour = CoreUtils.adaptiveColour(
      context,
      darkModeColour: Colors.white,
      lightModeColour: Colours.lightThemePrimaryTextColour,
    );
    return Stack(
      clipBehavior: Clip.none,
      alignment: AlignmentDirectional.center,
      children: [
        Image.asset(index == 1 ? Media.onBoardingOne : Media.onBoardingTwo,
            fit: BoxFit.fitHeight),
        Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (index == 1)
              Text.rich(
                textAlign: TextAlign.left,
                TextSpan(
                    text: 'One-Stop\n',
                    style: TextStyles.headingBold,
                    children: [
                      TextSpan(
                        text: 'Android Learning.',
                        style: TextStyle(
                          color: adaptiveColour,
                        ),
                      )
                    ]),
              )
            else
              Text.rich(
                textAlign: TextAlign.left,
                TextSpan(
                  text: 'Clean Architecture With ',
                  style: TextStyles.headingBold.copyWith(
                    color: adaptiveColour,
                  ),
                  children: const [
                    TextSpan(
                      text: "Riverpod.",
                      style: TextStyle(
                        color: Colours.lightThemeSecondaryColour,
                      ),
                    ),
                  ],
                ),
              ),
            if (index == 2)
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: RoundedButton(
                  height: 50,
                  text: AppLocalizations.of(context).onBoardingEnter,
                  onPressed: () {
                    sl<AppStorageService>().cacheVersion();
                    context.go('/', extra: 'home');
                  },
                ),
              )
          ],
        ),
      ],
    );
  }
}
