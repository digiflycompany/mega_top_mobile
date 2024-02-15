import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'bank_card_text_field.dart';

class AddNewCardBottomSheetBody extends StatelessWidget {
  const AddNewCardBottomSheetBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: context.width*0.045,right: context.width*0.045,top: context.height*0.055),
      child: const Column(
        children: [
          BankCardTextField()
        ],
      ),
    );
  }
}
