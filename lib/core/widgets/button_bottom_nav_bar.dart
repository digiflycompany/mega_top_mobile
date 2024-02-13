import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:mega_top_mobile/core/widgets/add_to_cart_button.dart';

class ButtonBottomNavBar extends StatelessWidget {
  final Function()? onTap;
  const ButtonBottomNavBar({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: context.height*0.141,
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.width*0.045,vertical:context.height*0.037),
        child: AddToCartButton(onTap: onTap,),
      ),
    );
  }
}
