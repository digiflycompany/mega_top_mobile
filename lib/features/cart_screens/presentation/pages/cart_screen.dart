import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/app_routes.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/core/widgets/app_bar_fav_icon.dart';
import 'package:mega_top_mobile/core/widgets/button_bottom_nav_bar.dart';
import 'package:mega_top_mobile/core/widgets/button_circular_progress.dart';
import 'package:mega_top_mobile/features/cart_screens/data/repositories/cart_repo.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/cubit/cart_cubit.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/cubit/cart_states.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/widgets/cart_checkout_button.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/widgets/cart_items_list.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/widgets/cart_screen_address.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/widgets/checkout_button_content.dart';
import 'package:mega_top_mobile/services/shared_preferences/preferences_helper.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit(CartRepoImp())..getUserCart(),
      child: Scaffold(
        backgroundColor: AppColors.circleAvatarBackground,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(context.height * 0.089),
          child: CustomFavouriteAppBar(AppLocalizations.of(context)!.cart),
        ),
        body: Column(
          children: [
            const CartScreenAddress(),
            Expanded(
              child: Container(
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: context.width * 0.045),
                  child: Column(
                    children: [
                      VerticalSpace(context.height * 0.033),
                      const Expanded(
                        child: CartItemsListView(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: BlocConsumer<CartCubit, CartState>(
          listener: (context, state) => context.read<CartCubit>().handleCartToAPIStates(context, state),
          builder: (context, state) {
            final cartLength = PreferencesHelper.getCart().length;

            if (cartLength > 0) {
              return ButtonBottomNavBar(
                button: CartCheckoutButton(
                  content: state is CartSentToAPILoading
                      ? const Center(child: ButtonCircularProgress())
                      : const CheckoutButtonContent(),
                  onTap: state is CartSentToAPILoading
                      ? null
                      : () async {
                    final token = await PreferencesHelper.getToken();
                    if (token == null) {
                      Routes.signUpOrLoginPageRoute.moveTo;
                    } else {
                      if (cartLength == 0) {
                        context.read<CartCubit>().showErrorToast(
                          context,
                          AppStrings.addToCartFailed,
                          AppStrings.yourShoppingCartIsEmptyEn,
                        );
                      } else {
                        context.read<CartCubit>().sendCartToApi(
                          PreferencesHelper.getCart(),
                        );
                      }
                    }
                  },
                ),
              );
            } else {
              return const SizedBox(); // Return an empty SizedBox when the cart is empty
            }
          },
        ),
      ),
    );
  }
}
