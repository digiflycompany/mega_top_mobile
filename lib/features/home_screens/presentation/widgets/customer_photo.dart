import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_color.dart';

class CustomerPhoto extends StatelessWidget {
  const CustomerPhoto({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      width:context.width*0.11 ,
      height: context.height*0.055,
      decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.circleAvatarBackground
      ),
      child: ClipOval(child: Image.asset(AppAssets.customerProfilePhoto,fit: BoxFit.cover,)),
    );
  }
}
