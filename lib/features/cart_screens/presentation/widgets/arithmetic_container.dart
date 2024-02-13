import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../core/utils/app_color.dart';

class ArithmeticContainer extends StatelessWidget {
  final String? icon;
  const ArithmeticContainer({super.key, this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width*0.09,
      height: context.height*0.044,
      decoration: const BoxDecoration(
          color:AppColors.iconsBackgroundColor,
          shape: BoxShape.circle
      ),
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: context.width*0.022,vertical: context.height*0.012),
        child: SvgPicture.asset(icon!,),
      ),
    );
  }
}
