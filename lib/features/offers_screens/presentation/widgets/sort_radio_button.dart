import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';


class SortBottomSheetAdaptiveRadioButton extends StatelessWidget {
  final String value;
  final String label;
  final String? description;
  final Function? onTap;
  final cubit;

  const SortBottomSheetAdaptiveRadioButton({
    Key? key,
    required this.value,
    required this.label,
    this.description,
    this.onTap,
    required this.cubit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        if(value != cubit.selectedValue) {
          cubit.selectOption(value);
          onTap!();
          Navigator.pop(context);
        }
      },
      child: Container(
        height: context.height * 0.065,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: context.width * 0.022),
        alignment: Alignment.centerLeft,
        child: Row(
          children: [
            Transform.scale(
              scale: 1.2.r,
              child: Radio.adaptive(
                activeColor: AppColors.primaryColor,
                focusColor: AppColors.primaryColor,
                value: value,
                groupValue: cubit.selectedValue,
                onChanged: (dynamic newValue) {
                  if (newValue != null) {
                    cubit.selectOption(newValue);
                  }
                },
              ),
            ),
            Text(
              label,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 14.sp),
            ),
            HorizontalSpace(context.width * 0.008),
            Text(
              description!,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 14.sp),
            ),
          ],
        ),
      ),
    );
  }
}
