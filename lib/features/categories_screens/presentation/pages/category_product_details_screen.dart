import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/app_routes.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/core/widgets/add_to_cart_button.dart';
import 'package:mega_top_mobile/core/widgets/button_bottom_nav_bar.dart';
import 'package:mega_top_mobile/core/widgets/product_detailed_image.dart';
import 'package:mega_top_mobile/core/widgets/product_details_app_bar.dart';
import 'package:mega_top_mobile/core/widgets/small_white_circular_progress_indicator.dart';
import 'package:mega_top_mobile/core/widgets/status_bar_color.dart';
import 'package:mega_top_mobile/features/cart_screens/data/repositories/cart_repo.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/cubit/cart_cubit.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/cubit/cart_states.dart';
import 'package:mega_top_mobile/features/categories_screens/cubit/category_cubit.dart';
import 'package:mega_top_mobile/features/categories_screens/cubit/category_state.dart';
import 'package:mega_top_mobile/features/categories_screens/presentation/widgets/product_detailed_body.dart';
import 'package:mega_top_mobile/services/shared_preferences/preferences_helper.dart';


class CategoryProductDetailsPage extends StatefulWidget {
  const CategoryProductDetailsPage({super.key});

  @override
  State<CategoryProductDetailsPage> createState() =>
      _CategoryProductDetailsPageState();
}

class _CategoryProductDetailsPageState
    extends State<CategoryProductDetailsPage> {
  late CategoryCubit categoryCubit;

  @override
  Widget build(BuildContext context) {
    const CustomStatusBarColor(color: AppColors.onboardingBackgroundColor);
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size(double.infinity, context.height * 0.089),
            child: const ProductDetailsAppBar()),
        body: BlocBuilder<CategoryCubit, CategoryState>(
          builder: (BuildContext context, CategoryState state) {
            categoryCubit = context.read<CategoryCubit>();
            return SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  ProductDetailedImage(),
                  ProductDetailedBody(),
                ],
              ),
            );
          },
        ),
        bottomNavigationBar: ButtonBottomNavBar(
          button: BlocBuilder<CategoryCubit, CategoryState>(
            builder: (context, state) {
              final categoryCubit = context.read<CategoryCubit>();
              return BlocProvider(
                create: (context) => CartCubit(CartRepoImp()),
                child: BlocConsumer<CartCubit, CartState>(
                  listener: (context,state)=>context.read<CartCubit>().handleAddToCartStates(context, state),
                  builder: (context, state) {
                    CartCubit cubit = context.read<CartCubit>();
                    return AddToCartButton(
                      content: state is CartSentToAPILoading?const SmallWhiteCircularProgressIndicator():Row(
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
                        final token = await PreferencesHelper.getToken();
                        if (token == null) {
                          Routes.signUpOrLoginPageRoute.moveTo;
                        } else {
                          cubit.addProductToCart(categoryCubit.selectedCategoryModel!.data!
                              .products[categoryCubit.selectedProductIndex].id);
                          print('Doneeeeeeeeeeeeeeeeee');
                        }
                      },
                    );
                  },
                ),
              );
            },
          ),
        ));
  }

  @override
  void dispose() {
    categoryCubit.setImageIndex(0);
    super.dispose();
  }
}
