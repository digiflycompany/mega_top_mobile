import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ViewAllRow extends StatelessWidget {
  final String? bigText;
  const ViewAllRow({super.key, this.bigText});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          bigText!,
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w700,
              fontSize: 18.sp),
        ),
        // const Spacer(),
        // Text(
        //   AppStrings.viewAllEn,
        //   style: TextStyle(
        //       color: AppColors.primaryColor,
        //       fontWeight: FontWeight.w700,
        //       fontSize: 14.sp),
        // ),
        // HorizontalSpace(context.width * 0.022),
        // SvgPicture.asset(AppAssets.primaryArrow),
      ],
    );
  }
}
