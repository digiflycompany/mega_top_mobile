import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/features/categories_screens/cubit/category_cubit.dart';
import 'package:mega_top_mobile/features/categories_screens/cubit/category_state.dart';
import 'package:mega_top_mobile/features/home_screens/cubit/home_cubit.dart';
import 'package:mega_top_mobile/features/home_screens/cubit/home_states.dart';
import 'cart_items_container.dart';

class CartItemsListView extends StatelessWidget {
  const CartItemsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return BlocConsumer<CategoryCubit, CategoryState>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = context.read<CategoryCubit>();
            if(cubit.orders.isNotNull){
              var orders = cubit.orders!.orders;
              return Expanded(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: orders.length,
                  itemBuilder: (BuildContext context, int index){
                    final order = orders[index];
                    if (order.lineItems.isNotEmpty){
                      final lineItem = order.lineItems[0];
                      return Padding(
                        padding: EdgeInsets.only(
                            right: context.width * 0.011,
                            left: context.width * 0.011,
                            bottom: context.height * 0.027,
                            top: context.height * 0.006),
                        child: CartItemsContainer(
                          productName: lineItem.name,
                          productPhoto: lineItem.image.src,
                          productType: lineItem.productId.toString(),
                          productPrice: lineItem.price.toString(),
                          discountPercent: '17%',
                          discount: false,
                        ),
                      );
                    }
                    return null;
                  },
                ),
              );
            }
            // if(cubit.orders.isNull){
            //   return EmptyDataPage(
            //     icon: AppAssets.emptyCartIcon,
            //     bigFontText: AppStrings.yourShoppingCartIsEmptyEn,
            //     smallFontText: AppStrings.browseOurProductsDescriptionEn,
            //     buttonText: AppStrings.continueShoppingEn,
            //   );
            // }
            else {
              return Center(
                child: CircularProgressIndicator.adaptive(),
              );
            }
          },
        );
      },
    );
  }
}
