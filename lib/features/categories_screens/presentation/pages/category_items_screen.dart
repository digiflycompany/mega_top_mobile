import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/features/categories_screens/cubit/category_cubit.dart';
import 'package:mega_top_mobile/features/categories_screens/cubit/category_item_details_cubit.dart';
import 'package:mega_top_mobile/features/categories_screens/cubit/category_state.dart';

import '../widgets/category_items_grid.dart';
import '../widgets/category_items_list.dart';
import '../widgets/category_items_options_row.dart';

class CategoryItemsPage extends StatelessWidget {
  const CategoryItemsPage({super.key});

  @override
  Widget build(BuildContext context) {
    CategoryCubit categoryCubit = context.read<CategoryCubit>();
    return BlocProvider<categoryItemDetailsCubit>(
      create: (BuildContext context) {
        return categoryItemDetailsCubit();
      },
      child: Scaffold(
        ///Error
        // appBar: PreferredSize(
        //     preferredSize: Size(double.infinity, context.height * 0.089),
        //     child: BlocBuilder<CategoryCubit, CategoryState>(
        //       builder: (BuildContext context, CategoryState state) {
        //         return categoryCubit.selectedCategoryModel != null &&
        //                 categoryCubit
        //                     .selectedCategoryModel!.productList.isNotEmpty
        //             ? PrimaryAppBar(categoryCubit
        //                 .selectedCategoryModel!
        //                 .productList[categoryCubit.selectedProductIndex]
        //                 .categories[0]
        //                 .name)
        //             : PrimaryAppBar("");
        //       },
        //     )),
        body: BlocBuilder<CategoryCubit, CategoryState>(
          builder: (BuildContext context, state) {
            ///Error
            // if (categoryCubit.selectedCategoryModel != null &&
            //     categoryCubit.selectedCategoryModel!.productList.isNotEmpty) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: context.width * 0.045),
              child: Column(
                children: [
                  CategoryItemsOptionsRow(
                    topPadding: context.height * 0.028,
                    bottomPadding: context.height * 0.033,
                  ),
                  BlocConsumer<CategoryCubit, CategoryState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      return categoryCubit.isGrid
                          ? const CategoryItemsGridView()
                          : const CategoryItemsListView();
                    },
                  ),
                ],
              ),
            );

            ///Error
            // } else if (categoryCubit.selectedCategoryModel != null &&
            //     categoryCubit.selectedCategoryModel!.productList.isEmpty &&
            //     state is SelectedCategoryFailure) {
            return Center(child: Text("products not found"));
            // } else {
            //   return Center(
            //     child: CircularProgressIndicator(),
            //   );
            // }
          },
        ),
      ),
    );
  }
}
