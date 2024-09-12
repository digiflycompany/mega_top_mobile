import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/core/widgets/add_to_cart_button.dart';
import 'package:mega_top_mobile/core/widgets/button_bottom_nav_bar.dart';
import 'package:mega_top_mobile/core/widgets/button_circular_progress.dart';
import 'package:mega_top_mobile/core/widgets/product_detailed_image.dart';
import 'package:mega_top_mobile/core/widgets/product_details_app_bar.dart';
import 'package:mega_top_mobile/core/widgets/status_bar_color.dart';
import 'package:mega_top_mobile/features/cart_screens/data/repositories/cart_repo.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/cubit/cart_cubit.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/cubit/cart_states.dart';
import 'package:mega_top_mobile/features/home_screens/cubit/home_cubit.dart';
import 'package:mega_top_mobile/features/home_screens/cubit/home_states.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/search_product_detailed_body.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SearchProductDetailsPage extends StatefulWidget {
  const SearchProductDetailsPage({super.key});

  @override
  State<SearchProductDetailsPage> createState() =>
      _SearchProductDetailsPageState();
}

class _SearchProductDetailsPageState extends State<SearchProductDetailsPage> {
  late HomeCubit homeCubit;

  @override
  Widget build(BuildContext context) {
    const CustomStatusBarColor(color: AppColors.onboardingBackgroundColor);

    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size(double.infinity, context.height * 0.089),
            child: const ProductDetailsAppBar()),
        body: BlocBuilder<HomeCubit, HomeState>(
          builder: (BuildContext context, HomeState state) {
            homeCubit = context.read<HomeCubit>();
            return SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  ProductDetailedImage(images: homeCubit.searchModel!
                      .data!.products[homeCubit.selectedProductIndex].images,
                    imagePosition: homeCubit.currentImageIndex,
                  cubit: homeCubit,
                  product: homeCubit.searchModel!
                      .data!.products[homeCubit.selectedProductIndex],
                  productId: homeCubit.searchModel!
                      .data!.products[homeCubit.selectedProductIndex].id,
                  ),
                  SearchProductDetailedBody(),
                ],
              ),
            );
          },
        ),
        bottomNavigationBar: ButtonBottomNavBar(
          button: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              final homeCubit = context.read<HomeCubit>();
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
                            AppLocalizations.of(context)!.addToCart,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 16.sp),
                          ),
                        ],
                      ),
                      onTap: () async {
                        context.read<CartCubit>().addProductToCart(
                          homeCubit.searchModel!
                              .data!.products[homeCubit.selectedProductIndex]
                              .id,
                          homeCubit.searchModel!
                              .data!.products[homeCubit.selectedProductIndex]
                              .title,
                          homeCubit.searchModel!
                              .data!.products[homeCubit.selectedProductIndex]
                              .price.finalPrice.toString(),
                          homeCubit.searchModel!
                              .data!.products[homeCubit.selectedProductIndex]
                              .images![0],
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
    homeCubit.setImageIndex(0);
    super.dispose();
  }
}
