import 'package:flutter/material.dart';
import 'package:mega_top_mobile/features/account_screens/orders_screen/presentation/widgets/stepper_widgets/circles/current_circle.dart';
import 'package:mega_top_mobile/features/account_screens/orders_screen/presentation/widgets/stepper_widgets/circles/done_circle.dart';

class FirstStepWidget extends StatelessWidget {
  const FirstStepWidget({super.key, required this.currentStep});

  final int currentStep;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Builder(
              builder: (context) {
                if (currentStep == 1) {
                  return const CurrentCircle(text: "1");
                } else {
                  return const DoneCircle();
                }
              },
            ),
          ],
        ),
      ],
    );
  }
}
