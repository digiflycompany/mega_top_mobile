import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_color.dart';

class FilterContainer extends StatelessWidget {
  final Function()? onTap;
  const FilterContainer({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: context.width * 0.145,
        height: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(context.height * 0.006),
            bottomRight: Radius.circular(context.height * 0.006),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: context.width * 0.045),
          child: SvgPicture.asset(AppAssets.filterWhiteIcon),
        ),
      ),
    );
  }
}
