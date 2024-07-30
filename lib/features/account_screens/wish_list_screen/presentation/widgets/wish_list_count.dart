import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/features/account_screens/profile_screen/presentation/cubit/account_details_cubit.dart';
import 'package:mega_top_mobile/features/account_screens/profile_screen/presentation/cubit/account_details_state.dart';

class WishListCount extends StatelessWidget {
  const WishListCount({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<AccountDetailsCubit, AccountDetailsState>(
  builder: (context, state) {
    return Padding(
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
            context.read<AccountDetailsCubit>().wishListCount.toString(),
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
  },
);
  }
}
