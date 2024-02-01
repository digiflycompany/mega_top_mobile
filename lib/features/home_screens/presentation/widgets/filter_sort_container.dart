import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../core/utils/app_color.dart';

class FilterSortContainer extends StatelessWidget {
  final String? icon;
  final Function()? onTap;
  const FilterSortContainer({super.key, this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: context.width*0.142,
        height: context.height*0.055,
        decoration: BoxDecoration(
          color: AppColors.circleAvatarBackground,
          borderRadius: BorderRadius.circular(context.height*0.006),
        ),
        child: Padding(
          padding:  EdgeInsets.symmetric(vertical:context.height*0.013,horizontal: context.width*0.043),
          child: SvgPicture.asset(icon!,),
        ),
      ),
    );
  }
}
