import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import '../../../../core/utils/spacer.dart';
import '../../../../core/widgets/primary_empty_button.dart';
import 'empty_cart_icon.dart';
import 'empty_response_text.dart';

class EmptyResponsePage extends StatelessWidget {
  final String? icon;
  final String? bigFontText;
  final String? smallFontText;
  final String? buttonText;
  const EmptyResponsePage({super.key, this.icon,this.buttonText, this.bigFontText, this.smallFontText});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:  EdgeInsets.symmetric(horizontal: context.width*0.045),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const WhiteCircleIcon(icon: AppAssets.emptyCartIcon,),
          VerticalSpace(context.height*0.055),
          EmptyResponseText(
            bigFontText: bigFontText,
            smallFontText: smallFontText,
          ),
          VerticalSpace(context.height*0.033),
          PrimaryOutlinedButton(
           text: buttonText,
            ),
        ],
      ),
    );
  }
}
