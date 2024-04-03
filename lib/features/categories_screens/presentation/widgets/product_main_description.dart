import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/core/widgets/available_container.dart';
import 'package:mega_top_mobile/core/widgets/discount_container.dart';
import 'package:mega_top_mobile/features/categories_screens/cubit/category_cubit.dart';
import 'package:mega_top_mobile/features/categories_screens/cubit/category_state.dart';
import 'package:mega_top_mobile/features/categories_screens/presentation/widgets/product_detailed_category.dart';
import 'package:mega_top_mobile/features/categories_screens/presentation/widgets/product_name.dart';
import 'package:mega_top_mobile/features/categories_screens/presentation/widgets/product_prices.dart';

class ProductMainDescription extends StatelessWidget {
  const ProductMainDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (BuildContext context, CategoryState state) {
        final categoryCubit = context.read<CategoryCubit>();
        return Padding(
          padding: EdgeInsets.only(top: context.height * 0.033),
          child: Column(
            children: [
              /// Product Details Row ////
              Row(
                children: [
                  Expanded(
                    child: ProductDetailedNameText(
                      name: categoryCubit.selectedCategoriesModel!
                          .productList[categoryCubit.selectedProductIndex].name,
                    ),
                  ),
                  HorizontalSpace(5.w),
                  const AvailableContainer(),
                  HorizontalSpace(context.width * 0.022),
                  DiscountContainer(
                    width: context.width * 0.118,
                    height: context.height * 0.033,
                    discountPercent: AppStrings.discountPercentEn,
                  )
                ],
              ),
              VerticalSpace(context.height * 0.011),
              ProductDetailedCategory(
                category: categoryCubit
                    .selectedCategoriesModel!
                    .productList[categoryCubit.selectedProductIndex]
                    .categories[0]
                    .name,
              ),
              VerticalSpace(context.height * 0.022),
              const ProductPrices(
                oldPrice: AppStrings.productOldPriceEn,
                currentPrice: AppStrings.productPriceEn,
              ),
              VerticalSpace(context.height * 0.029),
              // const ProductDetailedSmallDescription(
              //   description: AppStrings.productDetailedSmallDescriptionEn,
              // )
            ],
          ),
        );
      },
    );
  }
}
