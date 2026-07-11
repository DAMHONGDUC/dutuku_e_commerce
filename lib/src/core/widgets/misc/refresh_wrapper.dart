import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:flutter/material.dart';

class RefreshWrapper extends StatelessWidget {
  const RefreshWrapper({
    super.key,
    required this.onRefresh,
    required this.child,
  });

  final Future<void> Function() onRefresh;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      color: context.colorTheme.primary,
      backgroundColor: context.colorTheme.surfaceDefault,
      child: child,
    );
  }
}
