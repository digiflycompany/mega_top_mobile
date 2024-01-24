import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../core/utils/app_color.dart';

class FilterSortContainer extends StatelessWidget {
  final String? icon;
  const FilterSortContainer({super.key, this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
