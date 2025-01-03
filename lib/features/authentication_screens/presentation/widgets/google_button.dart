import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';

class GoogleButton extends StatelessWidget {
  final Function()? onTap;
  final String? text;
  const GoogleButton({super.key, this.onTap, this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: context.height * 0.069,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 1, color: AppColors.googleButtonBorder),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Stack(
          children: [
            Center(
              child: Text(
                text!,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 15.sp),
              ),
            ),
            Align(
                alignment: AlignmentDirectional.centerStart,
                child: Padding(
                  padding: EdgeInsets.only(left: context.width * 0.045),
                  child: SvgPicture.asset(AppAssets.googleIcon),
                )),
          ],
        ),
      ),
    );
  }
}
