import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class SearchTextField extends StatelessWidget {
  final FocusNode? focusNode;
  final TextEditingController ? textFormField;
  final Function ? onFieldSubmitted;
  const SearchTextField({super.key, this.focusNode,required this.textFormField, required this.onFieldSubmitted});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextFormField(
        onFieldSubmitted: (value){
          onFieldSubmitted!();
        },
        controller: textFormField,
        focusNode: focusNode,
        textInputAction: TextInputAction.search,
        cursorColor: AppColors.greyTextColor,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: AppLocalizations.of(context)!.searchHere,
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
