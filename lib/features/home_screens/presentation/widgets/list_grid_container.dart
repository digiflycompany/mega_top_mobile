import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';


class ListGridContainer extends StatelessWidget {
  final String? image;
  final String? text;
  final Function()? onTap;
  const ListGridContainer({super.key, this.image, this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: context.height * 0.055,
        width: context.width * 0.22,
        decoration: BoxDecoration(
            color: AppColors.circleAvatarBackground,
            borderRadius: BorderRadius.circular(context.height * 0.006)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(image!),
            HorizontalSpace(context.width * 0.022),
            Text(
              text!,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 15.5.sp),
            ),
          ],
        ),
      ),
    );
  }
}
