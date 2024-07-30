import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/features/categories_screens/cubit/category_cubit.dart';
import 'package:mega_top_mobile/features/categories_screens/cubit/category_item_details_cubit.dart';
import 'package:mega_top_mobile/features/categories_screens/cubit/category_state.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/primary_app_bar.dart';

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
  final controller = ScrollController();

  @override
  void initState() {
    final cubit = context.read<CategoryCubit>();
    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.offset) {
        cubit.hasMoreProducts = true;
        cubit.page++;
        cubit.getMoreProduct(cubit.selectedCategoryId!)
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
    categoryCubit = context.read<CategoryCubit>();
    return BlocProvider<categoryItemDetailsCubit>(
      create: (BuildContext context) {
        return categoryItemDetailsCubit();
      },
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size(double.infinity, context.height * 0.089),
            child: BlocBuilder<CategoryCubit, CategoryState>(
              builder: (BuildContext context, CategoryState state) {
                return PrimaryAppBar(categoryCubit.categories!.data!
                    .categories![categoryCubit.selectedProductIndex].name!);
              },
            )),
        body: BlocBuilder<CategoryCubit, CategoryState>(
          builder: (BuildContext context, state) {
            if (categoryCubit.selectedCategoryModel != null) {
              return Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: context.width * 0.045,vertical: context.height * 0.015),
                child: Column(
                  children: [
                    CategoryItemsOptionsRow(
                      topPadding: context.height * 0.028,
                      bottomPadding: context.height * 0.015,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        controller: controller,
                        child: Column(
                          children: [
                            categoryCubit.isGrid
                                ? const CategoryItemsGridView()
                                : const CategoryItemsListView(),
                            SizedBox(
                              height: 15.h,
                            ),
                            if (context.read<CategoryCubit>().hasMoreProducts == true)
                                Center(child: SizedBox(
                                    height: 15.h,
                                    width: 15.h,
                                    child: CircularProgressIndicator())),
                            SizedBox(
                              height: 25.h,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );

              ///Error
            } else if (categoryCubit.selectedCategoryModel != null &&
                //   categoryCubit.selectedCategoryModel!.productList.isEmpty &&
                state is SelectedCategoryFailure) {
              return Center(child: Text("products not found"));
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    categoryCubit.selectedCategoryModel = null;
    categoryCubit.page = 1;
    categoryCubit.minPriceController.clear();
    categoryCubit.maxPriceController.clear();
    categoryCubit.minPrice = null;
    categoryCubit.maxPrice = null;
    super.dispose();
  }
}
