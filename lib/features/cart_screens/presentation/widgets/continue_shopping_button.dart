import 'package:flutter/material.dart';
import '../../../../core/utils/app_string.dart';
import '../../../../core/widgets/primary_empty_button.dart';

class ContinueShoppingButton extends StatelessWidget {
  const ContinueShoppingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return const PrimaryEmptyButton(
      horizontalPadding: 0,
      text: AppStrings.continueShoppingEn,
    );
  }
}
