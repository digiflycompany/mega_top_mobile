import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/cubit/cart_cubit.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/cubit/cart_states.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/widgets/empty_response_page.dart';
import 'package:mega_top_mobile/services/shared_preferences/preferences_helper.dart';
import 'cart_items_container.dart';

class CartItemsListView extends StatelessWidget {
  const CartItemsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if(PreferencesHelper.getCart().length>0){
          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: PreferencesHelper.getCart().length,
            itemBuilder: (BuildContext context, int index) {
              final cartItem = PreferencesHelper.getCart()[index];
              return Padding(
                padding: EdgeInsets.only(
                    right: context.width * 0.011,
                    left: context.width * 0.011,
                    bottom: context.height * 0.027,
                    top: context.height * 0.006),
                child: CartItemsContainer(
                  productId: cartItem['_id'],
                  productName: cartItem['name'],
                  productPhoto: cartItem['image'],
                  productPrice: cartItem['price'].toString(),
                  quantity: cartItem['quantity'].toString(),
                ),
              );
            },
          );
        }
        else if (PreferencesHelper.getCart().length==0) {
          return EmptyDataPage(
            icon: AppAssets.emptyCartIcon,
            bigFontText: AppStrings.yourShoppingCartIsEmptyEn,
            smallFontText: AppStrings.browseOurProductsDescriptionEn,
          );
        } else {
          return Container();
        }
      },
    );
  }
}
