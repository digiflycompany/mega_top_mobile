import 'package:flutter/material.dart';
import 'package:mega_top_mobile/features/account_screens/orders_screen/presentation/widgets/stepper_widgets/circles/current_circle.dart';
import 'package:mega_top_mobile/features/account_screens/orders_screen/presentation/widgets/stepper_widgets/circles/default_circle.dart';

class FourthStepWidget extends StatelessWidget {
  const FourthStepWidget({super.key, this.currentStep});

  final int? currentStep;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Builder(builder: (context) {
          if (currentStep == 1 || currentStep == 2 || currentStep == 3) {
            return const DefaultCircle(text: "4");
          } else {
            return const CurrentCircle(
              text: '4',
            );
          }
        }),
      ],
    );
  }
}
