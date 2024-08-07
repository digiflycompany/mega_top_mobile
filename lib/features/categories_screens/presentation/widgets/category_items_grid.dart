import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/core/utils/app_routes.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/features/categories_screens/cubit/category_cubit.dart';
import 'package:mega_top_mobile/features/categories_screens/cubit/category_state.dart';

import '../../../home_screens/presentation/widgets/items_grid.dart';

class CategoryItemsGridView extends StatelessWidget {
  const CategoryItemsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (BuildContext context, CategoryState state) {
        return GridView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemCount: context
              .read<CategoryCubit>()
              .selectedCategoryModel!
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
                      .read<CategoryCubit>()
                      .selectedCategoryModel!
                      .data!
                      .products[index],
                  onTap: (){
                    context.read<CategoryCubit>().setCategoryProductIndex(selectedProductIndex: index);
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
