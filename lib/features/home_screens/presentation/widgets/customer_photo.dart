import 'package:flutter/cupertino.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import '../../../../core/utils/app_color.dart';

class CustomerPhoto extends StatelessWidget {
  final String? photo;
  const CustomerPhoto({super.key, this.photo});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width * 0.134,
      height: context.height * 0.065,
      decoration: const BoxDecoration(
          shape: BoxShape.circle, color: AppColors.circleAvatarBackground),
      child: ClipOval(
          child: Image.asset(
        photo!,
        fit: BoxFit.cover,
      )),
    );
  }
}
