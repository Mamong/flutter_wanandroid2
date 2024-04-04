import 'package:flutter/material.dart';

/// Widget used for a list shimmer effect
class LoadingView extends StatelessWidget {
  /// Creates a new instance of [ListItemShimmer]
  const LoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator(),);
  }
}