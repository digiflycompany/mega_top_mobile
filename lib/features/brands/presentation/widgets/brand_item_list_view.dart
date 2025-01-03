import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/features/brands/cubit/brands_cubit.dart';
import 'package:mega_top_mobile/features/brands/cubit/brands_state.dart';
import 'package:mega_top_mobile/features/brands/presentation/pages/brand_product_details_page.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/items_list.dart';

class BrandItemsListView extends StatelessWidget {
  const BrandItemsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BrandsCubit, BrandsState>(
        builder: (BuildContext context, BrandsState state) {
      final cubit = context.read<BrandsCubit>();
      return ListView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemCount: cubit.products.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
                padding: EdgeInsetsDirectional.only(
                    end: context.width * 0.011,
                    start: context.width * 0.011,
                    bottom: context.height * 0.027,
                    top: context.height * 0.006),
                child: ProductsListContainer(
                    index: index,
                    productName: cubit.products[index].title,
                    productPhoto: cubit.products[index].images!.length == 0
                        ? cubit.placeHolderImages![0]
                        : cubit.products[index].images![0],
                    productType: 'cubit.selectedBrand.type',
                    productPrice: '120',
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => BrandProductDetailsPage(
                                  product: cubit.products[index])));
                    }));
          });
    });
  }
}