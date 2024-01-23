import 'package:flutter/material.dart';
import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/app_string.dart';

class YourLatestSearch extends StatelessWidget {
  const YourLatestSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Text(
          AppStrings.yourLastSearchEn,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
        Spacer(),
        Text(
          AppStrings.clearEn,
          style: TextStyle(
            color: AppColors.primaryColor,
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
