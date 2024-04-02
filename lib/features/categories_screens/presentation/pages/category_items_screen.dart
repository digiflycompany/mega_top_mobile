import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/features/categories_screens/cubit/category_cubit.dart';
import 'package:mega_top_mobile/features/categories_screens/cubit/category_item_details_cubit.dart';
import 'package:mega_top_mobile/features/categories_screens/cubit/category_state.dart';

import '../../../../core/utils/app_string.dart';
import '../../../home_screens/presentation/widgets/primary_app_bar.dart';
import '../widgets/category_items_grid.dart';
import '../widgets/category_items_list.dart';
import '../widgets/category_items_options_row.dart';

class CategoryItemsPage extends StatefulWidget {
  const CategoryItemsPage({super.key});

  @override
  State<CategoryItemsPage> createState() => _CategoryItemsPageState();
}

class _CategoryItemsPageState extends State<CategoryItemsPage> {
  late CategoryCubit categoryCubit;

  @override
  Widget build(BuildContext context) {
    categoryCubit = context.read<CategoryCubit>();
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(double.infinity, context.height * 0.089),
          child: const PrimaryAppBar(AppStrings.upsEn)),
      body: BlocProvider<categoryItemDetailsCubit>(
        create: (BuildContext context) {
          return categoryItemDetailsCubit();
        },
        child: BlocBuilder<CategoryCubit, CategoryState>(
          builder: (BuildContext context, state) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: context.width * 0.045),
              child: categoryCubit.selectedCategoriesModel != null &&
                      categoryCubit
                          .selectedCategoriesModel!.productList.isNotEmpty
                  ? Column(
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
                    )
                  : Center(child: CircularProgressIndicator()),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    categoryCubit.selectedCategoriesModel = null;
    super.dispose();
  }
}
