import 'package:flutter/material.dart';
import 'package:mega_top_mobile/features/account_screens/orders_screen/presentation/widgets/stepper_widgets/circles/current_circle.dart';
import 'package:mega_top_mobile/features/account_screens/orders_screen/presentation/widgets/stepper_widgets/circles/default_circle.dart';
import 'package:mega_top_mobile/features/account_screens/orders_screen/presentation/widgets/stepper_widgets/circles/done_circle.dart';

class SecondStepWidget extends StatelessWidget {
  const SecondStepWidget({super.key, this.currentStep});

  final int? currentStep;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Builder(builder: (context) {
          if (currentStep == 1) {
            return const DefaultCircle(text: "2");
          } else if (currentStep == 2) {
            return const CurrentCircle(
              text: "2",
            );
          } else {
            return const DoneCircle();
          }
        }),
      ],
    );
  }
}
