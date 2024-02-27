import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/features/account_screens/orders_screen/cubit/orders_cubit.dart';
import 'package:mega_top_mobile/features/account_screens/orders_screen/cubit/orders_state.dart';
import 'package:mega_top_mobile/features/account_screens/orders_screen/presentation/widgets/order_condition_container.dart';

class CurrentPreviousOrdersRow extends StatelessWidget {
  const CurrentPreviousOrdersRow({super.key,});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrdersCubit, OrdersState>(
    builder: (context, state) {
      OrdersCubit ordersCubit = context.read<OrdersCubit>();
      return Row(
      children:[
        OrderConditionContainer(
          text: AppStrings.currentOrdersEn,
          borderColor: ordersCubit.selected==0?AppColors.primaryColor:Colors.white,
          textColor: ordersCubit.selected==0?AppColors.primaryColor:AppColors.greyTextColor,
          onTap: ()=> ordersCubit.selectOrderCondition(0),
        ),
        OrderConditionContainer(
          text: AppStrings.previousOrdersEn,
          borderColor: ordersCubit.selected==1?AppColors.primaryColor:Colors.white,
          textColor: ordersCubit.selected==1?AppColors.primaryColor:AppColors.greyTextColor,
          onTap: ()=> ordersCubit.selectOrderCondition(1),
        ),
      ],
    );
      },
    );
  }
}
