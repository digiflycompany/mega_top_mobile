import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/app_string.dart';
import '../../../../core/utils/spacer.dart';

class ViewAllRow extends StatelessWidget {
  final String? bigText;
  const ViewAllRow({super.key, this.bigText});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
         Text(
          bigText!,
          style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w700,
              fontSize: 18
          ),
        ),
        const Spacer(),
        const Text(
          AppStrings.viewAllEn,
          style: TextStyle(
              color: AppColors.primaryColor,
              fontWeight: FontWeight.w700,
              fontSize: 14
          ),
        ),
        HorizontalSpace(context.width*0.022),
        SvgPicture.asset(AppAssets.primaryArrow),
      ],
    );
  }
}
