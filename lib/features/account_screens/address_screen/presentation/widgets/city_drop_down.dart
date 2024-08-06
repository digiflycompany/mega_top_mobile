import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/widgets/edit_drop_down_field.dart';

class CityDropDown extends StatelessWidget {
  const CityDropDown({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 40.h),
      child: EditDropdownField(
        title: AppStrings.city,
        items: ['Item 1', 'Item 2', 'Item 3', 'Item 4'],
        hintText: AppStrings.selectYourCity,
        onChanged: (value) {
          print('Selected item: $value');
        },
      ),
    );
  }
}
