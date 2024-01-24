import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/app_string.dart';

class SearchResultCount extends StatelessWidget {
  final String? searchCount;
  const SearchResultCount({super.key, this.searchCount});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:EdgeInsets.symmetric(horizontal: context.width*0.045),
      child: Row(
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
      ),
    );
  }
}
