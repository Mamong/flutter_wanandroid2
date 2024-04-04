import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:flutter_wanandroid2/core/common/app/app_settings_provider.dart';

import 'package:theme/theme.dart';

import 'core/services/router.dart';
import 'l10n/app_localizations.dart';

/// Main App Widget
class MyApp extends ConsumerWidget {
  /// Creates new instance of [MyApp]
  const MyApp({super.key});

//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() => MyAppState();
// }
//
// class MyAppState extends ConsumerState<MyApp>{

  //final _router = router();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(appSettingsProvider);

    // final language = "zh-CN";
    // final color = Colors.green;

    Color color = settings.themeColor;
    List<String> lang = settings.language.split('-');

    // List<String> lang = lan.split('-');
    // final _random = Random();
    // Color color = _random.nextInt(10)%2==1?  Colors.red:Colors.green;
    final lightTheme = LightAppThemeData(primarySwatch: color);
    final darkTheme = DarkAppThemeData(primarySwatch: color);

    return AppTheme(
        lightTheme: lightTheme,
        darkTheme: darkTheme,
        child: ScreenUtilInit(
          designSize: const Size(750, 1334),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) => MaterialApp.router(
            theme: lightTheme.materialThemeData,
            darkTheme: darkTheme.materialThemeData,
            themeMode: ThemeMode.light,
            locale: Locale(lang[0], lang[1]),
            supportedLocales: const [
              Locale('en', 'US'),
              Locale('zh', 'CN'),
              Locale('zh', 'HK'),
            ],
            localizationsDelegates: const [
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              AppLocalizations.delegate,
              // ComponentLibraryLocalizations.delegate,
              //ProfileMenuLocalizations.delegate,
              RefreshLocalizations.delegate,
              // SignInLocalizations.delegate,
              // ForgotMyPasswordLocalizations.delegate,
              // SignUpLocalizations.delegate,
              // UpdateProfileLocalizations.delegate,
            ],
            routerConfig: router,
          ),
        ));
  }
}
