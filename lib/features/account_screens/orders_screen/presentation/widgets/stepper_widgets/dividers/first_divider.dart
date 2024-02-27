import 'package:flutter/material.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/features/account_screens/orders_screen/presentation/widgets/stepper_widgets/dividers/dashed_divider.dart';
import 'package:mega_top_mobile/features/account_screens/orders_screen/presentation/widgets/stepper_widgets/dividers/linear_divider.dart';

class FirstDivider extends StatelessWidget {
  const FirstDivider({super.key, required this.currentStep});

  final int currentStep;

  @override
  Widget build(BuildContext context) {
    if (currentStep == 1) {
      return const Expanded(
        child: DashedDivider(color: AppColors.hintColor),
      );
    } else if (currentStep == 2) {
      return const Expanded(
        child: DashedDivider(color: AppColors.primaryColor),
      );
    } else {
      return const Expanded(
        child: LinearDivider(),
      );
    }
  }
}
