import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/core/widgets/primary_empty_button.dart';
import 'package:mega_top_mobile/features/account_screens/orders_screen/presentation/cubit/orders_cubit.dart';
import 'package:mega_top_mobile/features/account_screens/orders_screen/presentation/cubit/orders_state.dart';

class CancelOrderCard extends StatelessWidget {
  const CancelOrderCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: context.height40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.doYouWantToCancel,
            style: TextStyle(
              color: AppColors.smallTextBlackColor,
              fontWeight: FontWeight.w700,
              fontSize: 14.sp,
            ),
          ),
          VerticalSpace(context.height20),
          BlocBuilder<OrdersCubit, OrdersState>(
            builder: (context, state) {
              OrdersCubit ordersCubit = context.read<OrdersCubit>();
              return PrimaryOutlinedButton(
                borderColor: AppColors.primarySecondRedColor,
                textColor: AppColors.primarySecondRedColor,
                text: AppStrings.cancelEn,
                onTap: ()=>ordersCubit.showCancelBottomSheet(context),
              );
            },
          )
        ],
      ),
    );
  }
}
