import 'package:flutter/material.dart';
import 'package:mega_top_mobile/core/utils/app_routes.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/features/home_screens/cubit/home_cubit.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/items_list.dart';

class SearchResultListView extends StatefulWidget {
  const SearchResultListView({super.key, required this.homeCubit, required this.controller});

  final HomeCubit homeCubit;
  final ScrollController  controller;

  @override
  State<SearchResultListView> createState() => _SearchResultListViewState();
}

class _SearchResultListViewState extends State<SearchResultListView> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        controller: widget.controller,
        physics: const BouncingScrollPhysics(),
        itemCount: widget.homeCubit.searchModel!.data!.products.length, // Set the item count to the length of the products list
        itemBuilder: (BuildContext context, int index) {
          final product = widget.homeCubit.searchModel!.data!.products[index];
          return Padding(
            padding: EdgeInsets.only(
                right: context.width * 0.011,
                left: context.width * 0.011,
                bottom: context.height * 0.027,
                top: context.height * 0.006),
            child: ProductsListContainer(
              index : index,
              productName: product.title,
              productPhoto: product.images![0],
              productType: product.categoryId.name,
              productPrice: product.price.finalPrice.toString(),
              onTap: (){
                widget.homeCubit.setCategoryProductIndex(selectedProductIndex: index);
                Routes.searchProductDetailsPageRoute.moveTo;
              },
            ),
          );
        },
      ),
    );
  }
}
