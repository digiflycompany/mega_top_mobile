import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/core/utils/app_routes.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/features/home_screens/cubit/home_cubit.dart';
import 'package:mega_top_mobile/features/home_screens/cubit/home_states.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/items_list.dart';

class SuggestedSearchResult extends StatelessWidget {
  const SuggestedSearchResult({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
      var cubit = HomeCubit().getCubit(context);
      var products = cubit.searchModel?.data?.products;
      return ListView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemCount: products?.length ?? 0,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
                padding: EdgeInsetsDirectional.only(
                    end: context.width * 0.011,
                    start: context.width * 0.011,
                    bottom: context.height * 0.027,
                    top: context.height * 0.006),
                child: ProductsListContainer(
                    index: index,
                    productName: products?[index].title,
                    productPhoto: products?[index].images?.length == 0
                        ? cubit.placeHolderImages![0]
                        : products?[index].images![0],
                    productType: 'cubit.selectedBrand.type',
                    productPrice: '120',
                    onTap: () {
                      cubit.setCategoryProductIndex(
                          selectedProductIndex: index);
                      Routes.searchProductDetailsPageRoute.moveTo;
                    }));
          });
    });
  }
}