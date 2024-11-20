import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/utils/functions/show_error_toast.dart';
import 'package:mega_top_mobile/core/widgets/no_internet_page.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/widgets/empty_response_page.dart';
import 'package:mega_top_mobile/features/categories_screens/cubit/category_cubit.dart';
import 'package:mega_top_mobile/features/categories_screens/cubit/category_state.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/primary_app_bar.dart';
import '../widgets/category_items_grid.dart';
import '../widgets/category_items_list.dart';
import '../widgets/category_items_options_row.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
        cubit.getMoreProduct(cubit.selectedCategoryId!).then((value) {
          if (cubit.hasMoreProducts == true) {
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
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(double.infinity, context.height * 0.089),
          child: BlocBuilder<CategoryCubit, CategoryState>(
            builder: (BuildContext context, CategoryState state) {
              return PrimaryAppBar(categoryCubit.categoriesModel!.data!
                  .categories![categoryCubit.selectedProductIndex].name!);
            },
          )),
      body: BlocConsumer<CategoryCubit, CategoryState>(
          listener: (BuildContext context, CategoryState state) {
        if (state is SelectedCategoryMoreProductsNoInternetConnection) {
          context.read<CategoryCubit>().page--;
          showErrorToast(context, AppLocalizations.of(context)!.noInternet, AppLocalizations.of(context)!.sorryThereIsNoInternet);
        }},

          builder: (BuildContext context, state) {
        if (state is SelectedCategoryNoInternetConnection ||
            state is SubCategoryNoInternetConnection) {
          return NoInternetScreen(buttonOnTap: () {
            categoryCubit
                .getSelectedCategories(categoryCubit.selectedCategoryId!);
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
        } else if (categoryCubit.selectedCategoryModel!.data!.products.length > 0 ) {
          return Padding(
            padding: EdgeInsets.symmetric(
                horizontal: context.width * 0.045,
                vertical: context.height * 0.015),
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
                        if (context.read<CategoryCubit>().hasMoreProducts ==
                            true)
                          Center(
                              child: SizedBox(
                                  height: 15.h,
                                  width: 15.h,
                                  child: CircularProgressIndicator.adaptive())),
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
        } else if (categoryCubit.selectedCategoryModel!.data!.products.length == 0) {
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
        }
      }),
    );
  }

  @override
  void dispose() {
    categoryCubit.selectedCategoryModel = null;
    categoryCubit.selectOption(AppStrings.defaultEn);
    categoryCubit.page = 1;
    categoryCubit.minPriceController.clear();
    categoryCubit.maxPriceController.clear();
    categoryCubit.minPrice = null;
    categoryCubit.maxPrice = null;
    categoryCubit.initializeCheckboxes(
        categoryCubit.subCategoriesModel!.data!.subcategories.length);
    super.dispose();
  }
}
