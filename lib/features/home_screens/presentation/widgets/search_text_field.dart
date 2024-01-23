import 'package:flutter/material.dart';
import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/app_string.dart';

class SearchTextField extends StatelessWidget {
  final FocusNode? focusNode;
  const SearchTextField({super.key, this.focusNode});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextFormField(
        focusNode: focusNode,
        cursorColor: AppColors.greyTextColor,
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: AppStrings.searchHereEn,
          hintStyle: TextStyle(
            color: AppColors.blackGreyColor,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
