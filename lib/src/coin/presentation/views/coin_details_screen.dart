import 'package:flutter/material.dart';
import 'package:flutter_wanandroid2/core/utils/constants/constants.dart';
import 'package:flutter_wanandroid2/l10n/app_localizations.dart';
import 'package:flutter_wanandroid2/src/coin/presentation/widgets/coin_detail_list.dart';
import 'package:go_router/go_router.dart';

class CoinDetailsScreen extends StatelessWidget {
  const CoinDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.menu_points_details),
        actions: [
          IconButton(
            onPressed: () {
              context.push(Uri(path: "/webview", queryParameters: {
                'title': l10n.points_rule,
                'url': Constants.pointRule
              }).toString());
            },
            icon: const Icon(Icons.help_outline),
          )
        ],
      ),
      body: const CoinDetailList(),
    );
  }
}
