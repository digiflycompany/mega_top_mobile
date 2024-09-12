import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/core/widgets/available_container.dart';
import 'package:mega_top_mobile/core/widgets/discount_container.dart';
import 'package:mega_top_mobile/core/widgets/not_available_container.dart';
import 'package:mega_top_mobile/features/categories_screens/presentation/widgets/product_detailed_category.dart';
import 'package:mega_top_mobile/features/categories_screens/presentation/widgets/product_detailed_small_description.dart';
import 'package:mega_top_mobile/features/categories_screens/presentation/widgets/product_name.dart';
import 'package:mega_top_mobile/features/categories_screens/presentation/widgets/product_prices.dart';
import 'package:mega_top_mobile/features/home_screens/cubit/home_cubit.dart';
import 'package:mega_top_mobile/features/home_screens/cubit/home_states.dart';

class SearchProductMainDescription extends StatelessWidget {
  const SearchProductMainDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (BuildContext context, HomeState state) {
        final categoryCubit = context.read<HomeCubit>();
        return Padding(
          padding: EdgeInsets.only(top: context.height * 0.033),
          child: Column(
            children: [
          /// Product Details Row ////
          Row(
          children: [
          Expanded(
          child: ProductDetailedNameText(
          name: categoryCubit.searchModel!.data!
              .products[categoryCubit.selectedProductIndex].title,
          ),
        ),
        HorizontalSpace(5.w),
            categoryCubit.searchModel!.data!
                .products[categoryCubit.selectedProductIndex].quantity !=0 ?const AvailableContainer() : NotAvailableContainer(),
        HorizontalSpace(context.width * 0.022),
        DiscountContainer(
        width: context.width * 0.118,
        height: context.height * 0.033,
        discountPercent: "${categoryCubit.getDiscountPercentage(
        finalPrice: categoryCubit.searchModel!.data!
            .products[categoryCubit.selectedProductIndex].price.finalPrice.toInt(),
        originPrice: categoryCubit.searchModel!.data!
            .products[categoryCubit.selectedProductIndex].price.originalPrice.toInt())}%",)
        ],
        ),
        VerticalSpace(context.height * 0.011),
        ProductDetailedCategory(
        category: categoryCubit
            .searchModel!
            .data!
            .products[categoryCubit.selectedProductIndex]
            .categoryId
            .name,
        ),
        VerticalSpace(context.height * 0.022),
        ProductPrices(
        currentPrice: categoryCubit
            .searchModel!
            .data!
            .products[categoryCubit.selectedProductIndex]
            .price
            .finalPrice
            .toString(),
        oldPrice: categoryCubit
            .searchModel!
            .data!
            .products[categoryCubit.selectedProductIndex]
            .price
            .originalPrice
            .toString(),
        ),
        VerticalSpace(context.height * 0.029),
        ProductDetailedSmallDescription(
        description: categoryCubit.searchModel!.data!
            .products[categoryCubit.selectedProductIndex].description,
        )
        ],
        ),
        );
      },
    );
  }
}
