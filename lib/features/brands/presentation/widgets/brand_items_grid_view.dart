import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/core/utils/app_routes.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/widgets/main_page_products_model.dart';
import 'package:mega_top_mobile/features/brands/cubit/brands_cubit.dart';
import 'package:mega_top_mobile/features/brands/cubit/brands_state.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/items_grid.dart';

class BrandItemsGridView extends StatelessWidget {
  const BrandItemsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BrandsCubit, BrandsState>(
        builder: (BuildContext context, BrandsState state) {
          var brand = BrandsCubit.get(context).selectedBrand;
          var products = BrandsCubit.get(context).products;
      return GridView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemCount: products.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: context.width * 0.027,
              mainAxisSpacing: context.height * 0.019,
              childAspectRatio: 0.68),
          itemBuilder: (BuildContext context, int index) {
            return Padding(
                padding: EdgeInsetsDirectional.only(
                    end: context.width * 0.011,
                    start: context.width * 0.011,
                    top: context.height * 0.004),
                child: ProductsGridContainer(
                    index: index,
                    discountPercent: "17% ",
                    discount: false,
                    product: products[index],
                    onTap: () {
                      // context.read<BrandsCubit>().setBrandProductIndex(selectedProductIndex: index);
                  Routes.brandProductDetailsPageRoute.moveTo;
                    }));
          });
    });
  }
}
