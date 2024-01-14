import 'package:flutter/material.dart';
import 'package:mega_top_mobile/core/utils/media_query.dart';
import '../utils/app_color.dart';
class RowTextButton extends StatelessWidget {
  final String? firstText;
  final String? buttonText;
  final Function()? onTap;
  const RowTextButton({super.key, this.firstText, this.buttonText, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
         Text(
          firstText!,
          style: const TextStyle(
              color: AppColors.greyTextColor,
              fontWeight: FontWeight.w500,
              fontSize: 14
          ),
        ),
        TextButton(
            onPressed: onTap,
            style: TextButton.styleFrom(
                padding: EdgeInsets.only(left: context.width*0.022),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                alignment: Alignment.centerLeft
            ),
            child:  Text(
              buttonText!,
              style: const TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w700
              ),
            ))
      ],
    );
  }
}
