import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/widgets/no_internet_page.dart';
import 'package:mega_top_mobile/features/cart_screens/data/repositories/cart_repo.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/cubit/cart_cubit.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/cubit/cart_states.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/widgets/empty_response_page.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/widgets/shimmer_cart_items_container.dart';
import 'cart_items_container.dart';

class CartItemsListView extends StatelessWidget {
  const CartItemsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit(CartRepoImp())..getUserCart(),
      child: BlocConsumer<CartCubit, CartState>(
        listener: (context, state) {},
        builder: (context, state) {
          if(state is GetUserCartSuccess && state.user.data!.products.length>0){
            return Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: state.user.data!.products.length,
                itemBuilder: (BuildContext context, int index) {
                  final cartItem =state.user.data!.products[index];
                  return Padding(
                    padding: EdgeInsets.only(
                        right: context.width * 0.011,
                        left: context.width * 0.011,
                        bottom: context.height * 0.027,
                        top: context.height * 0.006),
                    child: CartItemsContainer(
                      productName: cartItem.title,
                      productPhoto: cartItem.images[0],
                      productPrice: cartItem.price.finalPrice.toString(),
                      quantity: cartItem.quantity.toString(),
                    ),
                  );
                },
              ),
            );
          }
          else if(state is GetUserCartSuccess && state.user.data!.products.length == 0){
            return EmptyDataPage(
              icon: AppAssets.emptyCartIcon,
              bigFontText: AppStrings.yourShoppingCartIsEmptyEn,
              smallFontText: AppStrings.browseOurProductsDescriptionEn,
              buttonText: AppStrings.continueShoppingEn,
            );
          }
          else if(state is CartNoInternetConnection){
            return NoInternetScreen(
                buttonOnTap:()=> context.read<CartCubit>().getUserCart()
            );
          }
          else if(state is GetUserCartLoading){
            return ShimmerCartItemsContainer();
          }
          else {
            return Container();
          }
        },
      ),
    );

    // if(cubit.orders.isNull){
    //   return EmptyDataPage(
    //     icon: AppAssets.emptyCartIcon,
    //     bigFontText: AppStrings.yourShoppingCartIsEmptyEn,
    //     smallFontText: AppStrings.browseOurProductsDescriptionEn,
    //     buttonText: AppStrings.continueShoppingEn,
    //   );
    // }
    // else {
    //   return Center(
    //     child: CircularProgressIndicator.adaptive(),
    //   );
    // }
  }
}
