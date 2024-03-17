import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import '../../../../core/utils/app_color.dart';

class ArithmeticContainer extends StatelessWidget {
  final String? icon;
  final Function()? onTap;
  const ArithmeticContainer({super.key, this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: context.width * 0.09,
        height: context.height * 0.044,
        decoration: const BoxDecoration(
            color: AppColors.iconsBackgroundColor, shape: BoxShape.circle),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: context.width * 0.022,
              vertical: context.height * 0.012),
          child: SvgPicture.asset(
            icon!,
          ),
        ),
      ),
    );
  }
}
