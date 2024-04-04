import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_wanandroid2/core/common/app/app_settings_provider.dart';
import 'package:flutter_wanandroid2/core/common/app/current_user_provider.dart';
import 'package:flutter_wanandroid2/core/utils/core_utils.dart';
import 'package:flutter_wanandroid2/l10n/app_localizations.dart';
import 'package:flutter_wanandroid2/src/auth/presentation/app/riverpod/auth_provider.dart';
import 'package:go_router/go_router.dart';

class DashboardDrawer extends ConsumerWidget {
  const DashboardDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final drawerData = [
      //{'/(drawer)/(tabs)', 'home', 'menu_home' },
      ('/coin-detail', Icons.trending_up, l10n.menu_points),
      ('/collection', Icons.favorite, l10n.menu_collection),
      ('/websites', Icons.webhook, l10n.menu_websites),
      ('/about', Icons.person, l10n.menu_about),
      ('share', Icons.share, l10n.menu_share),
      ('/settings', Icons.settings, l10n.menu_settings),
      ('logout', Icons.power_settings_new, l10n.menu_logout),
    ];

    final settingsProvider = ref.watch(appSettingsProvider);
    final user = ref.watch(currentUserProvider);

    ref.listen(authProvider(), (_, next) {
      if (next is AuthError) {
        CoreUtils.showSnackBar(context, message: next.message);
      } else if (next is LoggedOut) {
        Navigator.of(context).pop();
      }
    });

    return Drawer(
        child: ListView(children: <Widget>[
      UserAccountsDrawerHeader(
        accountName: Text(user?.username ?? '登录'),
        accountEmail: const Text(''),
        currentAccountPicture: GestureDetector(
            onTap: () {
              if (user == null) context.push('/login');
            },
            child: CircleAvatar(
              child: user != null
                  ? Image.asset("assets/images/logo.jpg")
                  : const Icon(Icons.person),
            )),
        otherAccountsPictures: <Widget>[
          IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.cancel),color: Colors.white,)
        ],
        decoration:
            BoxDecoration(color: settingsProvider.themeColor),
      ),
      ...drawerData.map((e) => ListTile(
            title: Text(e.$3),
            leading: Icon(e.$2),
            // trailing: e.$1.startsWith("/")
            //     ? const Icon(Icons.arrow_forward_ios)
            //     : null,
            onTap: () {
              if (e.$1 == 'share') {
              } else if (e.$1 == 'logout') {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('提示'),
                        content: const Text('确定退出？'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text("取消"),
                          ),
                          TextButton(
                            onPressed: () async {
                              ref.read(authProvider().notifier).logout();
                            },
                            child: const Text("确定"),
                          ),
                        ],
                      );
                    });
              } else {
                context.push(e.$1);
              }
            },
          ))
    ]));
  }
}
