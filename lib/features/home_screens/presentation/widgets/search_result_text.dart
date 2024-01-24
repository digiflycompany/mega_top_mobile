import 'package:flutter/cupertino.dart';
import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/app_string.dart';

class SearchResult extends StatelessWidget {
  final String? searchCount;
  const SearchResult({super.key, this.searchCount});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          searchCount!,
          style: const TextStyle(
              color: AppColors.blackColor,
              fontSize: 14,
              fontWeight: FontWeight.w700
          ),
        ),
        const Text(
          AppStrings.resultsFound,
          style: TextStyle(
              color: AppColors.blackColor,
              fontSize: 14,
              fontWeight: FontWeight.w600
          ),
        ),
      ],
    );
  }
}
