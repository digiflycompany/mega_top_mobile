import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/widgets/cvv_text_field.dart';

import 'bank_card_text_field.dart';
import 'expiration_date_text_field.dart';

class AddNewCardBottomSheetBody extends StatelessWidget {
  const AddNewCardBottomSheetBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: context.width * 0.045,
          right: context.width * 0.045,
          top: context.height * 0.055,
          bottom: context.height * 0.022),
      child: Column(
        children: [
          const BankCardTextField(),
          VerticalSpace(context.height * 0.044),
          Row(
            children: [
              const ExpirationTextField(),
              HorizontalSpace(context.width * 0.045),
              const CvvTextField()
            ],
          ),
        ],
      ),
    );
  }
}
