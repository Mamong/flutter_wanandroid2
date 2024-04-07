import 'package:flutter/material.dart';
import 'package:flutter_wanandroid2/l10n/app_localizations.dart';

/// Widget used for a list shimmer effect
class NoMoreItemsView extends StatelessWidget {
  /// Creates a new instance of [ListItemShimmer]
  const NoMoreItemsView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    var titleStyle = Theme.of(context)
        .textTheme
        .headlineSmall
        ?.copyWith(color: Colors.grey.withOpacity(0.7), fontSize: 14);
    return Center(
        child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Text(
        l10n.footer_no_more,
        style: titleStyle,
      ),
    ));
  }
}
