import 'package:flutter/material.dart';
import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/app_string.dart';

class PriceContainer extends StatelessWidget {
  const PriceContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              AppStrings.fromEn,
              style: TextStyle(
                  color: AppColors.smallTextBlackColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 13
              ),
            ),
            Expanded(
              child: Center(
                child: Text(
                  AppStrings.toEn,
                  style: TextStyle(
                      color: AppColors.smallTextBlackColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 13
                  ),
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
