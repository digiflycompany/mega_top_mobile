import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/features/brands/cubit/brands_cubit.dart';
import 'package:mega_top_mobile/features/brands/cubit/brands_state.dart';
import 'package:mega_top_mobile/features/brands/presentation/widgets/brand_item_list_view.dart';
import 'package:mega_top_mobile/features/brands/presentation/widgets/brand_items_grid_view.dart';
import 'package:mega_top_mobile/features/brands/presentation/widgets/brand_items_options_row.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/primary_app_bar.dart';

class BrandItemPage extends StatefulWidget {
  const BrandItemPage({super.key});

  @override
  State<BrandItemPage> createState() => _BrandItemPageState();
}

class _BrandItemPageState extends State<BrandItemPage> {
  final controller = ScrollController();

  @override
  void initState() {
    final cubit = context.read<BrandsCubit>();
    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.offset) {
        cubit.hasMoreProducts = true;
        cubit.page++;
        /*cubit.getMoreProduct(cubit.selectedBrandId!).then((value) {
          if (cubit.hasMoreProducts == true) {
            cubit.selectOption(AppStrings.defaultEn);
          }
          cubit.hasMoreProducts = null;
        });*/
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(double.infinity, context.height * 0.089),
          child: BlocBuilder<BrandsCubit, BrandsState>(
            builder: (BuildContext context, BrandsState state) {
              var cubit = BrandsCubit.get(context);
              return PrimaryAppBar(cubit.selectedBrand.name ?? '');
            }
          )),
      body: BlocConsumer<BrandsCubit, BrandsState>(
          listener: (BuildContext context, BrandsState state) {
        /*if (state is SelectedBrandMoreProductsNoInternetConnection) {
              context.read<BrandCubit>().page--;
              context.read<BrandCubit>().showErrorToast(context, AppLocalizations.of(context)!.noInternet, AppLocalizations.of(context)!.sorryThereIsNoInternet);
            }*/
      }, builder: (BuildContext context, state) {
        var cubit = BrandsCubit.get(context);
        /*if (state is SelectedBrandNoInternetConnection ||
                state is SubBrandNoInternetConnection) {
              return NoInternetScreen(buttonOnTap: () {
                BrandCubit
                    .getSelectedCategories(BrandCubit.selectedBrandId!);
                categoryCubit
                    .getSubCategories(categoryCubit.selectedCategoryId!)
                    .then((onValue) {
                  if (categoryCubit.subCategoriesModel != null) {
                    categoryCubit.initializeCheckboxes(categoryCubit
                        .subCategoriesModel!.data!.subcategories.length);
                  }
                });
              });
            } else if (categoryCubit.selectedCategoryModel.isNull ||
                categoryCubit.subCategoriesModel.isNull) {
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
            } else if (categoryCubit.selectedCategoryModel!.data!.products.length > 0 ) {*/
        return Padding(
            padding: EdgeInsets.symmetric(
                horizontal: context.width * 0.045,
                vertical: context.height * 0.015),
            child: Column(children: [
              BrandItemsOptionsRow(
                  topPadding: context.height * 0.028,
                  bottomPadding: context.height * 0.015),
              Expanded(
                  child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      controller: controller,
                      child: Column(children: [
                        cubit.isGrid
                                ? const BrandItemsGridView()
                                : const BrandItemsListView(),
                        SizedBox(
                          height: 15.h
                        ),
                        if (context.read<BrandsCubit>().hasMoreProducts ==
                                true)
                        Center(
                            child: SizedBox(
                                height: 15.h,
                                width: 15.h,
                                child: CircularProgressIndicator.adaptive())),
                        SizedBox(height: 25.h)
                      ])))
            ]));
        /*} else if (categoryCubit.selectedCategoryModel!.data!.products.length == 0) {
              return EmptyDataPage(
                icon: AppAssets.emptyNotificationsIcon,
                bigFontText: AppLocalizations.of(context)!.noProducts,
                smallFontText: AppLocalizations.of(context)!.noProductListItems,
              );
            } else {
              return Center(
                child: Text(
                  AppLocalizations.of(context)!.serverError,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 14.sp),
                ),
              );
            }*/
      }),
    );
  }

  @override
  void dispose() {
    /*categoryCubit.selectedCategoryModel = null;
    categoryCubit.selectOption(AppStrings.defaultEn);
    categoryCubit.page = 1;
    categoryCubit.minPriceController.clear();
    categoryCubit.maxPriceController.clear();
    categoryCubit.minPrice = null;
    categoryCubit.maxPrice = null;
    categoryCubit.initializeCheckboxes(
        categoryCubit.subCategoriesModel!.data!.subcategories.length);*/
    super.dispose();
  }
}