import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/features/categories_screens/cubit/category_cubit.dart';
import 'package:mega_top_mobile/features/categories_screens/cubit/category_state.dart';

import '../../../../core/utils/app_color.dart';

class ProductImagesDots extends StatelessWidget {
  const ProductImagesDots({super.key});

  @override
  Widget build(BuildContext context) {
    CategoryCubit categoryCubit = context.read<CategoryCubit>();
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.only(bottom: context.height * 0.022),
          child: DotsIndicator(
            dotsCount: categoryCubit.selectedCategoriesModel!
                .productList[categoryCubit.selectedProductIndex].images.length,
            position: categoryCubit.currentImageIndex,
            decorator: DotsDecorator(
              //   size: Size(context.width * 0.12, context.height * 0.008),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
              activeColor: AppColors.primaryColor,
              color: AppColors.dotsColor,
              // activeSize: Size(context.width * 0.12, context.height * 0.008),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
            ),
          ),
        );
      },
    );
  }
}
