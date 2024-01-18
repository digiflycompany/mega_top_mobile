import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/customer_photo.dart';

class CustomerInformation extends StatelessWidget {
  const CustomerInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:EdgeInsets.only(left:context.width*0.045,top:context.height*0.0165),
      child:  Row(
        children: [
          const CustomerPhoto(),
          HorizontalSpace(context.width*0.022),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppStrings.customerNameEn,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 12
                ),
              ),
              VerticalSpace(context.height*0.01),
              Text(
                AppStrings.welcomeEn,
                style: TextStyle(
                    color: AppColors.greyTextColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 12
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
