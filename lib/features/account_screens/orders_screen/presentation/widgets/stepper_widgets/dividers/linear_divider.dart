import 'package:flutter/material.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';

class LinearDivider extends StatelessWidget {
  final Color color;

  const LinearDivider({
    Key? key,
    this.color = AppColors.primaryColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: 2,
      color: color,
    );
  }
}
