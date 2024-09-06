import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/locale/locale_cubit.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';

class ProfileOptionItem extends StatelessWidget {
  const ProfileOptionItem({
    super.key,
    required this.title,
    required this.mainIcon,
    this.onTap,
  });

  final String mainIcon;
  final String title;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsetsDirectional.only(start: 16.w, end: 16.w),
        height: 60.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4.r),
          boxShadow: const [
            BoxShadow(
              color: AppColors.containerShadow,
              offset: Offset(0, 2),
              blurRadius: 12,
              spreadRadius: 0,
            ),
          ],
        ),
        child: Row(
          children: [
            SvgPicture.asset(mainIcon, width: 24.w, height: 24.h),
            HorizontalSpace(7.h),
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13.sp),
            ),
            const Spacer(),
            BlocBuilder<LocaleCubit, Locale>(
              builder: (context, locale) {
                return Icon(
                    locale.languageCode == 'en' ? Icons.keyboard_arrow_right:Icons.keyboard_arrow_left,
                    size: 25.r);
              },
            ),
          ],
        ),
      ),
    );
  }
}
