import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../core/utils/app_string.dart';
import '../../../../core/utils/spacer.dart';

class WishListCount extends StatelessWidget {
  final String? count;
  const WishListCount({super.key, this.count});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.symmetric(vertical: context.height*0.028,horizontal: 4.w),
      child: Row(
        children: [
          /// Your Wish List Text
          Text(
            AppStrings.yourWishListEn,
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontSize: 14.sp
            ),
          ),
          const Spacer(),
          /// Wish List Items Count
          Text(
            count!,
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontSize: 14.sp
            ),
          ),
          HorizontalSpace(context.width*0.011),
          /// Products Text
          Text(
            AppStrings.products3En,
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 14.sp
            ),
          ),
        ],
      ),
    );
  }
}
