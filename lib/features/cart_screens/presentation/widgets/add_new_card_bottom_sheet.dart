import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/features/categories_screens/presentation/widgets/bottom_sheet_app_bar.dart';
import '../../../../core/widgets/primary_button.dart';
import 'add_new_card_bottom_sheet_body.dart';

class AddNewCardBottomSheet extends StatelessWidget {
  const AddNewCardBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height*0.572,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const BottomSheetAppBar(
              AppStrings.addNewCardEn
          ),
          const AddNewCardBottomSheetBody(),
          Expanded(
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: context.width*0.045),
                child: const PrimaryButton(
                  text: AppStrings.addBankCardEn,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
