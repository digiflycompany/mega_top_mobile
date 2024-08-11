import 'package:flutter/material.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';

class AddToCartButton extends StatelessWidget {
  final Function()? onTap;
  final Widget content;
  const AddToCartButton({super.key, this.onTap, required this.content});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(context.height * 0.006)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            content
          ],
        ),
      ),
    );
  }
}
