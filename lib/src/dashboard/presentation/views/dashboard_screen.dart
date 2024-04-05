import 'package:flutter/material.dart';
import 'package:flutter_wanandroid2/l10n/app_localizations.dart';
import 'package:flutter_wanandroid2/src/dashboard/presentation/widgets/dashboard_drawer.dart';
import 'package:go_router/go_router.dart';

/// Builds the "shell" for the app by building a Scaffold with a
/// BottomNavigationBar, where [child] is placed in the body of the Scaffold.
class DashboardScreen extends StatelessWidget {
  /// Constructs an [DashboardScreen].
  const DashboardScreen({
    required this.navigationShell,
    Key? key,
  }) : super(key: key ?? const ValueKey<String>('ScaffoldWithNavBar'));

  /// The navigation shell and container for the branch Navigators.
  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    //为了确保点击状态栏回到顶部，这里不能使用Scaffold,reference:
    //https://blog.csdn.net/SOHU_TECH/article/details/127116452
    //https://www.jianshu.com/p/246ca3959a59
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("首页"),
      // ),
      drawer: const DashboardDrawer(),
      body: navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        // discuss:https://stackoverflow.com/questions/72264138/flutter-bottomnavigationbar-colors-changes-to-transparent-after-adding-more-than
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: l10n.tab_home,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.account_tree),
            label: l10n.tab_hierarchy,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.group),
            label: l10n.tab_public_account,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.rocket_launch),
            label: l10n.tab_navigation,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.library_books),
            label: l10n.tab_project,
          )
        ],
        currentIndex: navigationShell.currentIndex,
        onTap: (int index) => _onTap(context, index),
      ),
    );
  }

  /// Navigate to the current location of the branch at the provided index when
  /// tapping an item in the BottomNavigationBar.
  void _onTap(BuildContext context, int index) {
    // When navigating to a new branch, it's recommended to use the goBranch
    // method, as doing so makes sure the last navigation state of the
    // Navigator for the branch is restored.
    navigationShell.goBranch(
      index,
      // A common pattern when using bottom navigation bars is to support
      // navigating to the initial location when tapping the item that is
      // already active. This example demonstrates how to support this behavior,
      // using the initialLocation parameter of goBranch.
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}
