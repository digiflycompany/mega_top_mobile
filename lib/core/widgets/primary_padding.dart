import 'package:flutter/material.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';

class PrimaryPadding extends StatelessWidget {
  final Widget child;
  const PrimaryPadding({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.width * 0.066),
      child: child,
    );
  }
}
