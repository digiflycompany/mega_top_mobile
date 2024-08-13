import 'package:flutter/material.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/widgets/add_bank_card_button.dart';
import 'package:mega_top_mobile/features/categories_screens/presentation/widgets/bottom_sheet_app_bar.dart';

import 'add_new_card_bottom_sheet_body.dart';

class AddNewCardBottomSheet extends StatelessWidget {
  const AddNewCardBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height * 0.572,
      color: Colors.white,
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BottomSheetAppBar(AppStrings.addNewCardEn),
          AddNewCardBottomSheetBody(),
          AddBankCardButton(),
        ],
      ),
    );
  }
}
