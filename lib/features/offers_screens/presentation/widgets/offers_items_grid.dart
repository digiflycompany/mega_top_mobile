import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/core/utils/app_routes.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/items_grid.dart';
import 'package:mega_top_mobile/features/offers_screens/cubit/offers_cubit.dart';
import 'package:mega_top_mobile/features/offers_screens/cubit/offers_state.dart';

class OffersItemsGridView extends StatelessWidget {
  const OffersItemsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OffersCubit,OffersState>(
      builder: (BuildContext context, OffersState state) {
        final cubit = context.read<OffersCubit>();
        return GridView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemCount: cubit.offerModel!.data!.products.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: context.width * 0.027,
            mainAxisSpacing: context.height * 0.019,
            childAspectRatio: 0.68,
          ),
          itemBuilder: (BuildContext context, int index) {
            final product = cubit.offerModel!.data!.products[index];
            return Padding(
              padding: EdgeInsets.only(
                  right: context.width * 0.011,
                  left: context.width * 0.011,
                  top: context.height * 0.004),
              child: ProductsGridContainer(
                index: index,
                discountPercent: cubit.getDiscountPercentage(finalPrice: product.price.finalPrice,
                    originPrice: product.price.originalPrice).toString(),
                product: product,
                onTap: (){
                  context.read<OffersCubit>().setCategoryProductIndex(selectedProductIndex: index);
                  Routes.offerProductDetailsPageRoute.moveTo;
                },
              ),
            );
          },
        );
      },
    );
  }
}
