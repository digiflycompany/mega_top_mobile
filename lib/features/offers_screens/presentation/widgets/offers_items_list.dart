import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/core/utils/app_routes.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/items_list.dart';
import 'package:mega_top_mobile/features/offers_screens/cubit/offers_cubit.dart';
import 'package:mega_top_mobile/features/offers_screens/cubit/offers_state.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_string.dart';
import '../../../home_screens/data/models/product_model.dart';

class OffersItemsListView extends StatelessWidget {
  const OffersItemsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OffersCubit,OffersState>(
      builder: (BuildContext context, OffersState state) {
        final cubit = context.read<OffersCubit>();
        return ListView.builder(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          itemCount:  cubit.offerModel!.data!.products.length,
          itemBuilder: (BuildContext context, int index) {
            final product = cubit.offerModel!.data!.products[index];
            return Padding(
              padding: EdgeInsets.only(
                  right: context.width * 0.011,
                  left: context.width * 0.011,
                  bottom: context.height * 0.027,
                  top: context.height * 0.006),
              child: ProductsListContainer(
                productName: product.title,
                productPhoto: product.images[0],
                productType: product.categoryId!.name,
                productPrice: product.price!.finalPrice!.toString(),
                onTap: (){
                  context.read<OffersCubit>().setCategoryProductIndex(selectedProductIndex: index);
                  Routes.offerProductDetailsPageRoute.moveTo;
                },
                onTapFavourite: (){
                  context.read<OffersCubit>().setCategoryProductIndex(selectedProductIndex: index);
                  Routes.offerProductDetailsPageRoute.moveTo;
                },
                // discountPercent: product.discountPercent,
                // discount: product.discount,
              ),
            );
          },
        );
      },
    );
  }
}
