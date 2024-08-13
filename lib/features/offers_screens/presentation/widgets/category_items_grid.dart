import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/core/utils/app_routes.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/features/offers_screens/cubit/offers_cubit.dart';
import 'package:mega_top_mobile/features/offers_screens/cubit/offers_state.dart';

import '../../../home_screens/presentation/widgets/items_grid.dart';

class CategoryItemsGridView extends StatelessWidget {
  const CategoryItemsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OffersCubit, OffersState>(
      builder: (BuildContext context, OffersState state) {
        return GridView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemCount: context
              .read<OffersCubit>()
              .offerModel!
              .data!
              .products
              .length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: context.width * 0.027,
            mainAxisSpacing: context.height * 0.019,
            childAspectRatio: 0.68,
          ),
          itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: EdgeInsets.only(
                  right: context.width * 0.011,
                  left: context.width * 0.011,
                  top: context.height * 0.004,
                ),
                child: ProductsGridContainer(
                  index: index,
                  discountPercent: "17% ",
                  discount: false,
                  product: context
                      .read<OffersCubit>()
                      .offerModel!
                      .data!
                      .products[index],
                  onTap: (){
                    context.read<OffersCubit>().setCategoryProductIndex(selectedProductIndex: index);
                    Routes.categoryProductDetailsPageRoute.moveTo;
                  },
                ),
              );
          },
        );
      },
    );
  }
}
