import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/utils/app_string.dart';
import '../../../../core/widgets/primary_button.dart';

class AddBankCardButton extends StatelessWidget {
  const AddBankCardButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: context.width*0.045),
          child: const PrimaryButton(
            text: AppStrings.addBankCardEn,
          ),
        ),
      ),
    );
  }
}
