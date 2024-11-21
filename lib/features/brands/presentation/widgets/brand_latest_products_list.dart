import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/features/brands/cubit/brands_cubit.dart';
import 'package:mega_top_mobile/features/brands/cubit/brands_state.dart';
import 'package:mega_top_mobile/features/brands/presentation/pages/brand_product_details_page.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/latest_products_container.dart';

class BrandLatestProductsList extends StatefulWidget {
  const BrandLatestProductsList({super.key});

  @override
  State<BrandLatestProductsList> createState() => _BrandLatestProductsListState();
}

class _BrandLatestProductsListState extends State<BrandLatestProductsList> {
  final controller = ScrollController();

  @override
  void initState() {
    final cubit = context.read<BrandsCubit>();
    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.offset) {
        cubit.getBrandProducts(more: true);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BrandsCubit, BrandsState>(
        builder: (_, state) {
          var cubit = context.read<BrandsCubit>();
            return SizedBox(
                height: context.height * 0.485,
                child: Row(children: [
                  Expanded(
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          controller: controller,
                          physics: BouncingScrollPhysics(),
                          itemCount: cubit.products.length,
                          itemBuilder: (_, index) {
                            return Row(children: [
                              GestureDetector(
                                  onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => BrandProductDetailsPage(
                                              product: cubit.products[index]))),
                                  child: LatestProductsContainer(
                                      productName: cubit.products[index].title,
                                      productPhoto: cubit
                                          .products[index]
                                          .images!
                                          .length ==
                                          0
                                          ? cubit.placeHolderImages![0]
                                          : cubit.products[index].images![0],
                                      productType: cubit.products[index]
                                          .categoryId
                                          .name,
                                      productPrice: cubit.products[index]
                                          .price
                                          .finalPrice
                                          .toString())),
                              HorizontalSpace(context.width * 0.045)
                            ]);
                          }))
                ]));

        });
  }
}