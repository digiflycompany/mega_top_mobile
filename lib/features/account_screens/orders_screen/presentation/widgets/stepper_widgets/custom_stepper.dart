import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/features/account_screens/orders_screen/cubit/orders_details_cubit.dart';
import 'package:mega_top_mobile/features/account_screens/orders_screen/cubit/orders_details_state.dart';
import 'package:mega_top_mobile/features/account_screens/orders_screen/presentation/widgets/stepper_widgets/circles/first_step_widget.dart';
import 'package:mega_top_mobile/features/account_screens/orders_screen/presentation/widgets/stepper_widgets/circles/fourth_step_widget.dart';
import 'package:mega_top_mobile/features/account_screens/orders_screen/presentation/widgets/stepper_widgets/circles/third_step_widget.dart';
import 'package:mega_top_mobile/features/account_screens/orders_screen/presentation/widgets/stepper_widgets/dividers/first_divider.dart';
import 'package:mega_top_mobile/features/account_screens/orders_screen/presentation/widgets/stepper_widgets/dividers/second_divider.dart';
import 'package:mega_top_mobile/features/account_screens/orders_screen/presentation/widgets/stepper_widgets/dividers/third_divider.dart';
import 'circles/second_step_widget.dart';

class CustomStepper extends StatelessWidget {
  const CustomStepper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrdersDetailsCubit(),
      child: BlocConsumer<OrdersDetailsCubit, OrdersDetailsState>(
        listener: (BuildContext context, OrdersDetailsState state) {},
        builder: (BuildContext context, OrdersDetailsState state) {
          final cubit = OrdersDetailsCubit.get(context);
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: context.width16),
            child: SizedBox(
              height: context.height * 0.30,
              child: Row(
                children: [
                  Column(
                    children: [
                      FirstStepWidget(currentStep: cubit.currentStep),
                      FirstDivider(currentStep: cubit.currentStep),
                      SecondStepWidget(currentStep: cubit.currentStep),
                      SecondDivider(currentStep: cubit.currentStep),
                      ThirdStepWidget(currentStep: cubit.currentStep),
                      ThirdDivider(currentStep: cubit.currentStep),
                      FourthStepWidget(currentStep: cubit.currentStep),
                    ],
                  ),
                  HorizontalSpace(7.w),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 22.h,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Order submitted",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700, fontSize: 13.sp),
                              ),
                              HorizontalSpace(8.w),
                              Text(
                                "On Sunday 17/12/2023",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 11.sp,
                                    color: AppColors.greyTextColor),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 22.h,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Waiting for confirmation",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700, fontSize: 13.sp),
                              ),
                              HorizontalSpace(8.w),
                              Expanded(
                                child: FittedBox(
                                  child: Text(
                                    "On Sunday 17/12/2023",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 11.sp,
                                        color: AppColors.greyTextColor),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 22.h,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Charged",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700, fontSize: 13.sp),
                              ),
                              HorizontalSpace(8.w),
                              Text(
                                "On Sunday 17/12/2023",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 11.sp,
                                    color: AppColors.greyTextColor),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 22.h,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Order has been delivered",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700, fontSize: 13.sp),
                              ),
                              HorizontalSpace(8.w),
                              Expanded(
                                child: FittedBox(
                                  child: Text(
                                    "On Sunday 17/12/2023",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 11.sp,
                                        color: AppColors.greyTextColor),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
