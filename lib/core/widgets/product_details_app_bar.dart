import 'package:flutter/material.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import '../../../../core/utils/app_color.dart';
import '../../../../core/widgets/app_bar_back_icon.dart';

class ProductDetailsAppBar extends StatelessWidget {
  const ProductDetailsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: context.height * 0.087,
        decoration: const BoxDecoration(
          color: AppColors.onboardingBackgroundColor,
        ),
        child: Row(
          children: [
            AppBarBackArrow(
              color: AppColors.onboardingBackgroundColor,
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
