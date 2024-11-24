import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/utils/functions/show_error_toast.dart';
import 'package:mega_top_mobile/core/widgets/no_internet_page.dart';
import 'package:mega_top_mobile/features/brands/cubit/brands_cubit.dart';
import 'package:mega_top_mobile/features/brands/cubit/brands_state.dart';
import 'package:mega_top_mobile/features/brands/presentation/widgets/brand_item_list_view.dart';
import 'package:mega_top_mobile/features/brands/presentation/widgets/brand_items_grid_view.dart';
import 'package:mega_top_mobile/features/brands/presentation/widgets/brand_items_options_row.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/widgets/empty_response_page.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/primary_app_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BrandProductsPage extends StatefulWidget {
  const BrandProductsPage({super.key, required this.brandName});

  final String brandName;

  @override
  State<BrandProductsPage> createState() => _BrandProductsPageState();
}

class _BrandProductsPageState extends State<BrandProductsPage> {
  final controller = ScrollController();

  @override
  void initState() {
    final cubit = context.read<BrandsCubit>();
    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.offset) {
        cubit.hasMoreProducts = true;
        cubit.getBrandProducts(more: true);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size(double.infinity, context.height * 0.089),
            child: PrimaryAppBar(widget.brandName)),
        body: BlocConsumer<BrandsCubit, BrandsState>(
            listener: (BuildContext context, BrandsState state) {
          if (state is ProductsNoInternetConnection) {
            showErrorToast(context, AppLocalizations.of(context)!.noInternet,
                AppLocalizations.of(context)!.sorryThereIsNoInternet);
          }
        }, builder: (BuildContext context, state) {
          var cubit = BrandsCubit.get(context);
          if (state is ProductsLoadingState)
            return Center(
                child: Theme(
                    data: Theme.of(context).copyWith(
                        colorScheme: ColorScheme.fromSwatch()
                            .copyWith(primary: AppColors.primaryColor)),
                    child: CircularProgressIndicator.adaptive()));
          else if (state is ProductsNoInternetConnection) {
            return NoInternetScreen(buttonOnTap: () {
              cubit.getBrandProducts();
            });
          } else if (cubit.products.isNotEmpty) {
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
                            SizedBox(height: 15.h),
                            if (state is MoreProductsLoading)
                              Center(
                                  child: SizedBox(
                                      height: 15.h,
                                      width: 15.h,
                                      child: CircularProgressIndicator
                                          .adaptive())),
                            SizedBox(height: 25.h)
                          ])))
                ]));
          } else if (cubit.products.isEmpty) {
            return EmptyDataPage(
                icon: AppAssets.emptyNotificationsIcon,
                bigFontText: AppLocalizations.of(context)!.noProducts,
                smallFontText:
                    AppLocalizations.of(context)!.noProductListItems);
          } else {
            return Center(
                child: Text(AppLocalizations.of(context)!.serverError,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 14.sp)));
          }
        }));
  }
}