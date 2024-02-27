import 'package:flutter/material.dart';
import 'package:mega_top_mobile/features/account_screens/orders_screen/presentation/widgets/stepper_widgets/circles/current_circle.dart';
import 'package:mega_top_mobile/features/account_screens/orders_screen/presentation/widgets/stepper_widgets/circles/default_circle.dart';
import 'package:mega_top_mobile/features/account_screens/orders_screen/presentation/widgets/stepper_widgets/circles/done_circle.dart';

class ThirdStepWidget extends StatelessWidget {
  const ThirdStepWidget({super.key, this.currentStep});

  final int? currentStep;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Builder(builder: (context) {
          if (currentStep == 1 || currentStep == 2) {
            return const DefaultCircle(text: "3");
          } else if (currentStep == 3) {
            return const CurrentCircle(
              text: '3',
            );
          } else {
            return const DoneCircle();
          }
        }),
      ],
    );
  }
}
