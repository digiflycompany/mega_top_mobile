import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/customer_icon.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/customer_name.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/customer_photo.dart';
import '../../../../core/utils/app_assets.dart';

class CustomerInformation extends StatelessWidget {
  const CustomerInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:EdgeInsets.only(top:context.height*0.0165),
      child:  Row(
        children: [
          const CustomerPhoto(photo: AppAssets.customerProfilePhoto,),
          HorizontalSpace(context.width*0.022),
          const CustomerName(name:AppStrings.customerNameEn,),
          const Spacer(),
          const CustomerIcon(icon: AppAssets.favouritesIcon,number: AppStrings.twelve,),
          HorizontalSpace(context.width*0.022),
          const CustomerIcon(icon: AppAssets.notificationIcon,number: AppStrings.fourteen,),
        ],
      ),
    );
  }
}
