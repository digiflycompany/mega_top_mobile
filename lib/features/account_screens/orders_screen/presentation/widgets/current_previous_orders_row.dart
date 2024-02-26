import 'package:flutter/material.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/features/account_screens/orders_screen/presentation/widgets/order_condition_container.dart';

class CurrentPreviousOrdersRow extends StatelessWidget {
  final int? isSelected;
  const CurrentPreviousOrdersRow({super.key,this.isSelected=0});

  @override
  Widget build(BuildContext context) {
    return Row(
      children:[
        OrderConditionContainer(
          text: AppStrings.currentOrdersEn,
          borderColor: isSelected==0?AppColors.primaryColor:Colors.white,
          textColor: isSelected==0?AppColors.primaryColor:AppColors.greyTextColor,
          onTap: ()=> isSelected==0,
        ),
        OrderConditionContainer(
          text: AppStrings.previousOrdersEn,
          borderColor: isSelected==1?AppColors.primaryColor:Colors.white,
          textColor: isSelected==1?AppColors.primaryColor:AppColors.greyTextColor,
          onTap: ()=> isSelected==1,
        ),
      ],
    );
  }
}
