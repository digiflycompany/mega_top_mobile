import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';

class AddToCartBottomSheet extends StatelessWidget {
  const AddToCartBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: context.height*0.407,
        color: Colors.white,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: context.height*0.144,
              decoration: const BoxDecoration(
                color: AppColors.addToCartBottomSheetBackgroundColor,
              ),
            )

          ],
        )
    );
  }
}
