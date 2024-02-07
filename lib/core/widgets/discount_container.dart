import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/app_color.dart';

class DiscountContainer extends StatelessWidget {
  final String? discountPercent;
  final double? width;
  final double? height;
  const DiscountContainer({super.key, this.discountPercent, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height:height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(context.height*0.003),
          color: AppColors.redIconColor
      ),
      child:  Center(
        child: Text(
          discountPercent!,
          style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 12
          ),
        ),
      ),
    );
  }
}
