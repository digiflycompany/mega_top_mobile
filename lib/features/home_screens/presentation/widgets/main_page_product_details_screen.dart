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
import 'package:mega_top_mobile/core/widgets/product_details_app_bar.dart';
import 'package:mega_top_mobile/core/widgets/status_bar_color.dart';
import 'package:mega_top_mobile/features/cart_screens/data/repositories/cart_repo.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/cubit/cart_cubit.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/cubit/cart_states.dart';
import 'package:mega_top_mobile/features/categories_screens/cubit/category_cubit.dart';
import 'package:mega_top_mobile/features/categories_screens/cubit/category_state.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/main_page_product_body.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/main_page_product_detailed_image.dart';

class MainPageProductDetailsScreen extends StatelessWidget {
  final List<String>? images;
  final int imagePosition;
  final String? productId;
  final cubit;
  final String? name;
  final String? categoryName;
  final String? finalPrice;
  final String? originalPrice;
  final String? description;
  final int? quantity;
  const MainPageProductDetailsScreen({super.key,
    required this.images,
    required this.imagePosition,
    required this.productId,
    required this.cubit,
    required this.name,
    required this.categoryName,
    required this.finalPrice,
    required this.originalPrice,
    required this.description,
    required this.quantity
  });

  @override
  Widget build(BuildContext context) {
    const CustomStatusBarColor(color: AppColors.onboardingBackgroundColor);

    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(double.infinity, context.height * 0.089),
          child: const ProductDetailsAppBar()),
      body:  SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                MainPageProductDetailedImage(images: images,
                  imagePosition: imagePosition,
                  cubit: cubit,
                  productId: productId,
                ),
                MainPageProductDetailedBody(
                  originalPrice: originalPrice,
                  finalPrice: finalPrice,
                  description: description,
                  cubit: cubit,
                  categoryName: categoryName,
                  quantity: quantity,
                  name: name,
                ),
              ],
            ),
          ),
      bottomNavigationBar: ButtonBottomNavBar(
        button: BlocBuilder<CategoryCubit, CategoryState>(
          builder: (context, state) {
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
                        productId,
                        name,
                        finalPrice,
                        images![0],
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
}
