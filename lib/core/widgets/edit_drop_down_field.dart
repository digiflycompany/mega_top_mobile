import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EditDropdownField extends StatelessWidget {
  final Widget? suffix;
  final List<String> items;
  final String title;
  final String? hintText;
  final String? selectedValue;
  final ValueChanged<String?>? onChanged;
  final String? Function(String?)? validator;

  const EditDropdownField({
    super.key,
    this.suffix,
    required this.title,
    required this.items,
    this.hintText,
    this.selectedValue,
    this.onChanged,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: TextStyle(
                color: AppColors.blackColor,
                fontWeight: FontWeight.w600,
                fontSize: 14.sp)),
        VerticalSpace(4.h),
        DropdownSearch<String>(
          items: items,
          selectedItem: selectedValue,
          popupProps: PopupProps.menu(
            showSearchBox: true,
            searchFieldProps: TextFieldProps(
              cursorColor: AppColors.blackGreyColor,
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14.sp),
            ),
          ),
          dropdownDecoratorProps: DropDownDecoratorProps(
            dropdownSearchDecoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(
                  color: AppColors.hintColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 12.sp),
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(width: 1, color: AppColors.googleButtonBorder),
              ),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(width: 1, color: AppColors.primaryColor),
              ),
              prefixIconConstraints: BoxConstraints(minWidth: context.width * 0.072),
              suffixIcon: suffix,
            ),
          ),
          onChanged: onChanged,
          validator: validator ?? (value) {
            if (value == null || value.isEmpty) {
              return AppLocalizations.of(context)!.cityCanNotBeEmpty;
            }
            return null;
          },
        ),
      ],
    );
  }
}
