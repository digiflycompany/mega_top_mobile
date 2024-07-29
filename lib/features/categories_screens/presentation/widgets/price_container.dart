import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/features/categories_screens/cubit/category_cubit.dart';
import 'package:mega_top_mobile/features/categories_screens/cubit/category_state.dart';
import 'package:mega_top_mobile/features/categories_screens/presentation/widgets/price_text_field.dart';
import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/app_string.dart';
import '../../../../core/utils/spacer.dart';

class PriceContainer extends StatelessWidget {
  const PriceContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit,CategoryState>(
      builder: (context,state){
        return Column(
          children: [
            Align(
              alignment: AlignmentDirectional.topStart,
              child: Text(
                AppStrings.priceBottomSheetEn,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 15.sp,
                ),
              ),
            ),
            VerticalSpace(context.height * 0.032),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  AppStrings.fromEn,
                  style: TextStyle(
                      color: AppColors.smallTextBlackColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 13.sp),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      AppStrings.toEn,
                      style: TextStyle(
                          color: AppColors.smallTextBlackColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 13.sp),
                    ),
                  ),
                )
              ],
            ),
            VerticalSpace(context.height * 0.022),
             Row(
              children: [
                PriceTextField(price: context.read<CategoryCubit>().minPriceController),
                Spacer(),
                PriceTextField(price: context.read<CategoryCubit>().maxPriceController),
              ],
            ),
          ],
        );
      },
    );
  }
}
