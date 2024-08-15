import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/features/account_screens/orders_screen/presentation/cubit/orders_cubit.dart';
import 'package:mega_top_mobile/features/account_screens/orders_screen/presentation/cubit/orders_state.dart';

class CancelBottomSheetAdaptiveRadioButton extends StatelessWidget {
  final String value;
  final String label;

  const CancelBottomSheetAdaptiveRadioButton({
    Key? key,
    required this.value,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrdersCubit, OrdersState>(
      builder: (context, state) {
        OrdersCubit ordersCubit = context.read<OrdersCubit>();
        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          //onTap: () => ordersCubit.selectOption(value),
          child: Container(
            height: context.height * 0.065,
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: context.width * 0.022),
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                Transform.scale(
                  scale: 1.2.r,
                  child: Radio.adaptive(
                    activeColor: AppColors.primaryColor,
                    focusColor: AppColors.primaryColor,
                    value: value,
                    groupValue: ordersCubit.selectedValue,
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        //ordersCubit.selectOption(newValue);
                      }
                    },
                  ),
                ),
                Text(
                  label,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 14.sp),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
