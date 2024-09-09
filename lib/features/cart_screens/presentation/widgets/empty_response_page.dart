import 'package:flutter/material.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/core/widgets/primary_empty_button.dart';
import 'empty_cart_icon.dart';
import 'empty_response_text.dart';

class EmptyDataPage extends StatelessWidget {
  final String? icon;
  final String? bigFontText;
  final String? smallFontText;
  final String? buttonText;
  final Function()? buttonOnTap;

  const EmptyDataPage({
    super.key,
    this.icon,
    this.buttonText,
    this.bigFontText,
    this.smallFontText,
    this.buttonOnTap,
  });

  @override
  Widget build(BuildContext context) {
    final double horizontalPadding = context.width * 0.045;
    final double verticalSpacing1 = context.height * 0.055;
    final double verticalSpacing2 = context.height * 0.033;

    return Padding(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
        child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
              // Ensure that `icon` is handled safely
              WhiteCircleIcon(icon: icon),
              VerticalSpace(verticalSpacing1),
              EmptyResponseText(
                  bigFontText: bigFontText ?? '', // Provide a default value
                  smallFontText: smallFontText ?? '' // Provide a default value
                  ),
              VerticalSpace(verticalSpacing2),
              if (buttonText != null && buttonText!.isNotEmpty)
                PrimaryOutlinedButton(
                    text: buttonText!,
                    onTap: buttonOnTap ??
                        () {} // Provide a default empty function if null
                    )
            ])));
  }
}