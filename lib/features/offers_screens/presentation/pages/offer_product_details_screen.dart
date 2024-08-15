import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/core/widgets/add_to_cart_button.dart';
import 'package:mega_top_mobile/core/widgets/button_bottom_nav_bar.dart';
import 'package:mega_top_mobile/core/widgets/button_circular_progress.dart';
import 'package:mega_top_mobile/core/widgets/product_detailed_image.dart';
import 'package:mega_top_mobile/core/widgets/product_details_app_bar.dart';
import 'package:mega_top_mobile/features/cart_screens/data/repositories/cart_repo.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/cubit/cart_cubit.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/cubit/cart_states.dart';
import 'package:mega_top_mobile/features/offers_screens/cubit/offers_cubit.dart';
import 'package:mega_top_mobile/features/offers_screens/cubit/offers_state.dart';
import 'package:mega_top_mobile/features/offers_screens/presentation/widgets/product_detailed_body.dart';

import '../../../../core/widgets/status_bar_color.dart';

class OfferProductDetailsPage extends StatefulWidget {
  const OfferProductDetailsPage({super.key});

  @override
  State<OfferProductDetailsPage> createState() =>
      _OfferProductDetailsPageState();
}

class _OfferProductDetailsPageState
    extends State<OfferProductDetailsPage> {
  late OffersCubit offerCubit;

  @override
  Widget build(BuildContext context) {
    const CustomStatusBarColor(color: AppColors.onboardingBackgroundColor);
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size(double.infinity, context.height * 0.089),
            child: const ProductDetailsAppBar()),
        body: BlocBuilder<OffersCubit, OffersState>(
          builder: (BuildContext context, OffersState state) {
            offerCubit = context.read<OffersCubit>();
            return  SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  ProductDetailedImage(images: offerCubit.offerModel!.data!.products[offerCubit.selectedProductIndex].images,
                  imagePosition: offerCubit.currentImageIndex,
                  cubit: offerCubit,
                  ),
                  ProductDetailedBody(),
                ],
              ),
            );
          },
        ),
        bottomNavigationBar: ButtonBottomNavBar(
          button: BlocBuilder<OffersCubit, OffersState>(
            builder: (context, state) {
              final offersCubit = context.read<OffersCubit>();
              return BlocProvider(
                create: (context) => CartCubit(CartRepoImp()),
                child: BlocConsumer<CartCubit, CartState>(
                  listener: (context, state) {
                    if (state is CartUpdated) {
                      context.read<CartCubit>().showAddedToCartBottomSheet(context);
                    }
                  },
                  builder: (context, state) {
                    return AddToCartButton(
                      content: state is CartSentToAPILoading
                          ? const ButtonCircularProgress()
                          : Row(
                        children: [
                          SvgPicture.asset(
                            AppAssets.cartButtonIcon,
                            width: context.width * 0.066,
                          ),
                          HorizontalSpace(context.width * 0.022),
                          Text(
                            AppStrings.addToCartEn,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 16.sp),
                          ),
                        ],
                      ),
                      onTap: () async {
                        context.read<CartCubit>().addProductToCart(
                          offersCubit.offerModel!
                              .data!.products[offersCubit.selectedProductIndex]
                              .id,
                          offersCubit.offerModel!
                              .data!.products[offersCubit.selectedProductIndex]
                              .title,
                          offersCubit.offerModel!
                              .data!.products[offersCubit.selectedProductIndex]
                              .price!.finalPrice.toString(),
                          offersCubit.offerModel!
                              .data!.products[offersCubit.selectedProductIndex]
                              .images[0],
                        );
                        print('Product added to cart');
                      },
                    );
                  },
                ),
              );
            },
          ),
        ),);
  }

  @override
  void dispose() {
    offerCubit.setImageIndex(0);
    super.dispose();
  }
}
