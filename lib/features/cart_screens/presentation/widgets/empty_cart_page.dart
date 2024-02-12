import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/utils/spacer.dart';
import 'continue_shopping_button.dart';
import 'empty_cart_icon.dart';
import 'empty_cart_text.dart';

class EmptyCartPage extends StatelessWidget {
  const EmptyCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:  EdgeInsets.symmetric(horizontal: context.width*0.045),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const EmptyCartIcon(),
          VerticalSpace(context.height*0.055),
          const EmptyCartText(),
          VerticalSpace(context.height*0.033),
          const ContinueShoppingButton(),
        ],
      ),
    );
  }
}
