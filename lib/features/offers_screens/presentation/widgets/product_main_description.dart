import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/core/widgets/available_container.dart';
import 'package:mega_top_mobile/core/widgets/discount_container.dart';
import 'package:mega_top_mobile/core/widgets/not_available_container.dart';
import 'package:mega_top_mobile/features/offers_screens/cubit/offers_cubit.dart';
import 'package:mega_top_mobile/features/offers_screens/cubit/offers_state.dart';
import 'package:mega_top_mobile/features/offers_screens/presentation/widgets/product_detailed_category.dart';
import 'package:mega_top_mobile/features/offers_screens/presentation/widgets/product_detailed_small_description.dart';
import 'package:mega_top_mobile/features/offers_screens/presentation/widgets/product_name.dart';
import 'package:mega_top_mobile/features/offers_screens/presentation/widgets/product_prices.dart';


class ProductMainDescription extends StatelessWidget {
  const ProductMainDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OffersCubit, OffersState>(
      builder: (BuildContext context, OffersState state) {
        final offersCubit = context.read<OffersCubit>();
        return Padding(
          padding: EdgeInsets.only(top: context.height * 0.033),
          child: Column(
            children: [
          /// Product Details Row ////
          Row(
          children: [
          Expanded(
          child: ProductDetailedNameText(
          name: offersCubit.offerModel!.data!
              .products[offersCubit.selectedProductIndex].title,
          ),
        ),
        HorizontalSpace(5.w),
            offersCubit.offerModel!.data!
                .products[offersCubit.selectedProductIndex].quantity !=0 ?const AvailableContainer() : NotAvailableContainer(),
        HorizontalSpace(context.width * 0.022),
        DiscountContainer(
        width: context.width * 0.118,
        height: context.height * 0.033,
        discountPercent: "${offersCubit.getDiscountPercentage(
        finalPrice: offersCubit.offerModel!.data!
            .products[offersCubit.selectedProductIndex].price.finalPrice.toInt(),
        originPrice: offersCubit.offerModel!.data!
            .products[offersCubit.selectedProductIndex].price.originalPrice.toInt())}%",)
        ],
        ),
        VerticalSpace(context.height * 0.011),
        ProductDetailedCategory(
        category: offersCubit
            .offerModel!
            .data!
            .products[offersCubit.selectedProductIndex]
            .categoryId
            .name,
        ),
        VerticalSpace(context.height * 0.022),
        ProductPrices(
        currentPrice: offersCubit
            .offerModel!
            .data!
            .products[offersCubit.selectedProductIndex]
            .price
            .finalPrice
            .toString(),
        oldPrice: offersCubit
            .offerModel!
            .data!
            .products[offersCubit.selectedProductIndex]
            .price
            .originalPrice
            .toString(),
        ),
        VerticalSpace(context.height * 0.029),
        ProductDetailedSmallDescription(
        description: offersCubit.offerModel!.data!
            .products[offersCubit.selectedProductIndex].description,
        )
        ],
        ),
        );
      },
    );
  }
}
