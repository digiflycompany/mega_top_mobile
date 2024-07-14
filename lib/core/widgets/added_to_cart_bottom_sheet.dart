import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/core/widgets/primary_button.dart';
import 'package:mega_top_mobile/core/widgets/primary_empty_button.dart';
import 'package:mega_top_mobile/features/categories_screens/cubit/category_cubit.dart';
import 'package:mega_top_mobile/features/categories_screens/cubit/category_state.dart';
import 'package:mega_top_mobile/features/home_screens/cubit/home_cubit.dart';
import 'package:mega_top_mobile/features/home_screens/cubit/home_states.dart';
//import 'package:mega_top_mobile/services/shared_preferences/preferences_helper.dart';
import '../utils/app_routes.dart';
import 'cart_bottom_sheet_product_details.dart';

class AddToCartBottomSheet extends StatelessWidget {
  const AddToCartBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
  builder: (context, state) {
        return BlocConsumer<CategoryCubit, CategoryState>(
  listener: (context, state) {
    if(state is addToCartSuccess){
      Routes.cartPageRoute.moveTo;
    }
  },
  builder: (context, state) {
    //CategoryCubit categoryCubit = context.read<CategoryCubit>();
  //  Object token = PreferencesHelper.getToken();
   // bool isUserLoggedIn = token.isNotNull;
    return Container(
            height: context.height * 0.407,
            color: Colors.white,
            child: Column(
              children: [
                const CartBottomSheetProductDetails(),
                Expanded(
                  child: Padding(
                    padding:
                    EdgeInsets.symmetric(horizontal: context.width * 0.045),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        /// View Cart Button
                        PrimaryButton(
                          text: AppStrings.viewCartEn,
                          onTap: () {
                            // if (isUserLoggedIn) {
                            //   categoryCubit.addToCart(
                            //       PreferencesHelper.getID!, categoryCubit.selectedCategoriesModel!.productList[categoryCubit.selectedProductIndex].id, 1);
                            //   categoryCubit.getProductsDetails(categoryCubit.selectedCategoriesModel!.productList[categoryCubit.selectedProductIndex].id);
                            // } else {
                            //   Routes.signUpOrLoginPageRoute.moveTo;
                            // }
                          },
                        ),
                        VerticalSpace(context.height * 0.033),
                        /// Continue Shopping Button
                        PrimaryOutlinedButton(
                          text: AppStrings.continueShoppingEn,
                          onTap: () => Navigator.pop(context),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ));
  },
);
  },
);
  }
}
