import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/core/widgets/add_to_cart_button.dart';
import 'package:mega_top_mobile/core/widgets/button_bottom_nav_bar.dart';
import 'package:mega_top_mobile/core/widgets/button_circular_progress.dart';
import 'package:mega_top_mobile/core/widgets/main_page_products_model.dart';
import 'package:mega_top_mobile/core/widgets/product_detailed_image.dart';
import 'package:mega_top_mobile/core/widgets/product_details_app_bar.dart';
import 'package:mega_top_mobile/core/widgets/status_bar_color.dart';
import 'package:mega_top_mobile/features/brands/cubit/brands_cubit.dart';
import 'package:mega_top_mobile/features/brands/cubit/brands_state.dart';
import 'package:mega_top_mobile/features/brands/presentation/widgets/brand_product_details_body.dart';
import 'package:mega_top_mobile/features/cart_screens/data/repositories/cart_repo.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/cubit/cart_cubit.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/cubit/cart_states.dart';
import 'package:mega_top_mobile/features/categories_screens/cubit/category_cubit.dart';
import 'package:mega_top_mobile/features/categories_screens/cubit/category_state.dart';

class BrandProductDetailsPage extends StatefulWidget {
  const BrandProductDetailsPage({super.key, required this.product});
  final Product product;

  @override
  State<BrandProductDetailsPage> createState() =>
      _BrandProductDetailsPageState();
}

class _BrandProductDetailsPageState extends State<BrandProductDetailsPage> {
  @override
  Widget build(BuildContext context) {
    const CustomStatusBarColor(color: AppColors.onboardingBackgroundColor);

    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size(double.infinity, context.height * 0.089),
            child: const ProductDetailsAppBar()),
        body: BlocBuilder<BrandsCubit, BrandsState>(
            builder: (BuildContext context, BrandsState state) {
          var cubit = context.read<BrandsCubit>();
          var product = widget.product;
          return SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(children: [
                ProductDetailedImage(
                    images: product.images!.length == 0
                        ? cubit.placeHolderImages
                        : product.images,
                    imagePosition: cubit.currentImageIndex,
                    cubit: cubit,
                    productId: product.id,
                    product: product),
                BrandProductDetailedBody(product: product)
              ]));
        }),
        bottomNavigationBar: ButtonBottomNavBar(button:
            BlocBuilder<CategoryCubit, CategoryState>(
                builder: (context, state) {
          final categoryCubit = context.read<CategoryCubit>();
          return BlocProvider(
              create: (context) => CartCubit(CartRepoImp()),
              child: BlocConsumer<CartCubit, CartState>(
                  listener: (context, state) {
                if (state is CartUpdated) {
                  context.read<CartCubit>().showAddedToCartBottomSheet(context);
                }
              }, builder: (context, state) {
                return AddToCartButton(
                    content: state is CartSentToAPILoading
                        ? const ButtonCircularProgress()
                        : Row(children: [
                            SvgPicture.asset(AppAssets.cartButtonIcon,
                                width: context.width * 0.066),
                            HorizontalSpace(context.width * 0.022),
                            Text(AppLocalizations.of(context)!.addToCart,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16.sp))
                          ]),
                    onTap: () async {
                      context.read<CartCubit>().addProductToCart(
                          categoryCubit.selectedCategoryModel?.data!
                              .products[categoryCubit.selectedProductIndex].id ?? widget.product.id,
                          categoryCubit
                              .selectedCategoryModel
                              ?.data
                              ?.products[categoryCubit.selectedProductIndex]
                              .title ?? widget.product.title,
                          categoryCubit
                              .selectedCategoryModel
                              ?.data
                              ?.products[categoryCubit.selectedProductIndex]
                              .price
                              .finalPrice
                              .toString() ?? widget.product.price.finalPrice.toString(),
                          categoryCubit
                              .selectedCategoryModel
                              ?.data
                              ?.products[categoryCubit.selectedProductIndex]
                              .images?[0] ?? widget.product.images?[0]);
                      print('Product added to cart');
                    });
              }));
        })));
  }

  @override
  void dispose() {
    // categoryCubit.setImageIndex(0);
    super.dispose();
  }
}