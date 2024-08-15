import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/app_string.dart';

class SearchTextField extends StatelessWidget {
  final FocusNode? focusNode;
  final TextEditingController ? textFormField;
  final Function ? onTap;
  const SearchTextField({super.key, this.focusNode,required this.textFormField, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextFormField(
        onTap: (){
          onTap!();
        },
        controller: textFormField,
        focusNode: focusNode,
        textInputAction: TextInputAction.search,
        cursorColor: AppColors.greyTextColor,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: AppStrings.searchHereEn,
          hintStyle: TextStyle(
            color: AppColors.blackGreyColor,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
