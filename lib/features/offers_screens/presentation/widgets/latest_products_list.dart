import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/app_routes.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/latest_products_container.dart';
import 'package:mega_top_mobile/features/offers_screens/cubit/offers_cubit.dart';
import 'package:mega_top_mobile/features/offers_screens/cubit/offers_state.dart';

class LatestProductsList extends StatefulWidget {
  const LatestProductsList({super.key});

  @override
  State<LatestProductsList> createState() => _LatestProductsListState();
}

class _LatestProductsListState extends State<LatestProductsList> {

  late OffersCubit categoryCubit;
  final controller = ScrollController();

  @override
  void initState() {
    final cubit = context.read<OffersCubit>();
    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.offset) {
        cubit.hasMoreProducts = true;
        cubit.page++;
        cubit.getMoreProduct()
            .then((value){
          if(cubit.hasMoreProducts == true)
          {
            cubit.selectOption(AppStrings.defaultEn);
          }
          cubit.hasMoreProducts = null;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    categoryCubit = context.read<OffersCubit>();
    return BlocConsumer<OffersCubit, OffersState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = context.read<OffersCubit>();
        if(cubit.offerModel != null){
          return SizedBox(
            height: context.height * 0.485,
            child: Row(
              children: [
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    controller: controller,
                    physics: BouncingScrollPhysics(),
                    itemCount: cubit
                        .offerModel!
                        .data!
                        .products
                        .length,
                    itemBuilder: (context, index) {
                        return Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                cubit.setCategoryProductIndex(
                                    selectedProductIndex: index);
                                Routes.offerProductDetailsPageRoute.moveTo;
                              },
                              child: LatestProductsContainer(
                                productName: cubit.offerModel!.data!
                                    .products[index].title,
                                productPhoto: cubit.offerModel!.data!
                                    .products[index].images[0],
                                productType: cubit.offerModel!.data!
                                    .products[index].categoryId!.name!,
                                productPrice: cubit.offerModel!.data!
                                    .products[index].price!.finalPrice!
                                    .toString(),
                              ),
                            ),
                            HorizontalSpace(context.width * 0.045),
                          ],
                        );
                    },
                  ),
                ),
              ],
            ),
          );
        }
        return Center(
          child: Theme(
            data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.fromSwatch().copyWith(
                primary: AppColors.primaryColor,
              ),
            ),
            child: CircularProgressIndicator.adaptive(),
          ),
        );
      },
    );
  }


}
