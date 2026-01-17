import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_wanandroid2/core/res/media.dart';
import 'package:go_router/go_router.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter_wanandroid2/core/common/app/current_user_provider.dart';
import 'package:flutter_wanandroid2/core/utils/constants/constants.dart';
import 'package:flutter_wanandroid2/core/utils/core_utils.dart';
import 'package:flutter_wanandroid2/l10n/app_localizations.dart';
import 'package:flutter_wanandroid2/src/auth/presentation/app/riverpod/auth_provider.dart';

class DashboardDrawer extends ConsumerWidget {
  const DashboardDrawer({super.key});

  void showLogoutAlert(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);

    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(l10n.tips),
            content: Text(l10n.logout_confirm),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(l10n.cancel),
              ),
              TextButton(
                onPressed: () async {
                  ref.read(authProvider().notifier).logout();
                },
                child: Text(l10n.confirm),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final drawerData = [
      //{'/(drawer)/(tabs)', 'home', 'menu_home' },
      ('/coin-detail', Icons.trending_up, l10n.menu_points),
      ('/collection', Icons.favorite, l10n.menu_collection),
      ('/websites', Icons.language, l10n.menu_websites),
      ('/about', Icons.person, l10n.menu_about),
      ('share', Icons.share, l10n.menu_share),
      ('/settings', Icons.settings, l10n.menu_settings),
      ('logout', Icons.power_settings_new, l10n.menu_logout),
    ];

    final user = ref.watch(currentUserProvider);

    ref.listen(authProvider(), (_, next) {
      if (next is AuthError) {
        CoreUtils.showSnackBar(context, message: next.message);
      } else if (next is LoggedOut) {
        Navigator.of(context).pop();
      }
    });

    return Drawer(
        child: ListView(
            padding: const EdgeInsets.only(top: 0.0),
            children: <Widget>[
          UserAccountsDrawerHeader(
            currentAccountPictureSize: Size.square(160.w),
            accountEmail: Text(user?.username ?? l10n.login),
            accountName: const Text(''),
            currentAccountPicture: GestureDetector(
                onTap: () {
                  if (user == null) context.push('/login');
                },
                child: CircleAvatar(
                  child: user != null
                      ? Image.asset(Media.logo)
                      : const Icon(Icons.person),
                )),
            otherAccountsPictures: <Widget>[
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.cancel),
                color: Colors.white,
              )
            ],
            decoration: BoxDecoration(color: Theme.of(context).primaryColor),
          ),
          ...drawerData
              .where((value) => user != null || value.$1 != 'logout')
              .map((e) => ListTile(
                    title: Text(e.$3),
                    leading: Icon(e.$2),
                    // trailing: e.$1.startsWith("/")
                    //     ? const Icon(Icons.arrow_forward_ios)
                    //     : null,
                    onTap: () {
                      if (user == null &&
                          ['/coin-detail', '/collection'].contains(e.$1)) {
                        context.push('/login');
                        return;
                      }
                      if (e.$1 == 'share') {
                        SharePlus.instance.share(
                            ShareParams(text: l10n.share_app_desc(Constants.downloadUrl))
                        );
                      } else if (e.$1 == 'logout') {
                        showLogoutAlert(context, ref);
                      } else {
                        context.push(e.$1);
                      }
                    },
                  ))
        ]));
  }
}
