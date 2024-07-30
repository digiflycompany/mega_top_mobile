import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/features/categories_screens/cubit/category_cubit.dart';
import 'package:mega_top_mobile/features/categories_screens/cubit/category_state.dart';

class ProductPrices extends StatelessWidget {
  final String? currentPrice;
  final String? oldPrice;
  const ProductPrices({super.key, this.currentPrice, this.oldPrice});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (BuildContext context, CategoryState state) {
        final categoryCubit = context.read<CategoryCubit>();
        return Row(
          children: [
            /// Product Current Price ///
            ///Error
            // Text(
            //   categoryCubit
            //           .selectedCategoryModel!
            //           .productList[categoryCubit.selectedProductIndex]
            //           .price
            //           .isEmptyOrNull
            //       ? "0"
            //       : categoryCubit.selectedCategoryModel!
            //           .productList[categoryCubit.selectedProductIndex].price,
            //   style: TextStyle(
            //       color: AppColors.primaryColor,
            //       fontWeight: FontWeight.w700,
            //       fontSize: 20.sp),
            // ),
            // HorizontalSpace(context.width * 0.045),
            //
            // /// Product Old Price ///
            // Text(
            //   oldPrice!,
            //   style: TextStyle(
            //       color: AppColors.oldPriceColor,
            //       fontWeight: FontWeight.w600,
            //       fontSize: 18.sp,
            //       decoration: TextDecoration.lineThrough,
            //       decorationColor: AppColors.oldPriceColor,
            //       decorationThickness: 1.3),
            // ),
          ],
        );
      },
    );
  }
}
