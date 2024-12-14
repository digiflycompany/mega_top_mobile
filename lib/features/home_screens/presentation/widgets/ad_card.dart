import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/app_routes.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/widgets/custom_button.dart';
import 'package:mega_top_mobile/core/widgets/custom_cached_network_image.dart';
import 'package:mega_top_mobile/core/widgets/custom_image.dart';
import 'package:mega_top_mobile/features/brands/cubit/brands_cubit.dart';
import 'package:mega_top_mobile/features/brands/presentation/pages/brand_products_page.dart';
import 'package:mega_top_mobile/features/categories_screens/cubit/category_cubit.dart';
import 'package:mega_top_mobile/features/home_screens/cubit/home_cubit.dart';
import 'package:mega_top_mobile/features/home_screens/cubit/home_states.dart';
import 'package:mega_top_mobile/features/home_screens/data/models/advertisement_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mega_top_mobile/features/brands/data/models/brands_response.dart'
    as brandModel;

class AdCard extends StatelessWidget {
  const AdCard({super.key, required this.ad});
  final Advertisement ad;

  @override
  Widget build(BuildContext context) {
    String currentLang = Localizations.localeOf(context).languageCode;
    double width = MediaQuery.of(context).size.width;
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return InkWell(
            onTap: () {
              if (ad.brandId != null) {
                var cubit = BrandsCubit.get(context);
                cubit.selectBrand(brandModel.Brand(
                    name: ad.brandId?.name, id: ad.brandId?.id));
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => BrandProductsPage(
                            brandName: ad.brandId?.name ?? '')));
                cubit.getBrandProducts();
              } else if (ad.categoryId != null) {
                var cubit = CategoryCubit().getCubit(context);
                cubit.selectedCategoryId = ad.categoryId?.id;
                // cubit.setCategoryProductIndex(selectedProductIndex: index);
                cubit.getSelectedCategories(ad.categoryId!.id!);
                cubit.getSubCategories(ad.categoryId!.id!).then((onValue) {
                  if (cubit.subCategoriesModel != null) {
                    cubit.initializeCheckboxes(
                        cubit.subCategoriesModel!.data!.subcategories.length);
                  }
                });
                Routes.categoryItemsPageRoute.moveTo;
              } else if (ad.productId != null) {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => AdDetailsScreen(id: ad.id!)));
              } else if (ad.subCategoryId != null) {
              } else {}
            },
            child: Stack(children: [
              CustomImage(
                  imagePath: currentLang == 'en'
                      ? AppAssets.adEnBackground
                      : AppAssets.adArBackground,
                  w: width * .85,
                  fit: BoxFit.fill,
                  h: 173),
              Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Padding(
                    padding: EdgeInsets.only(
                        top: 16,
                        bottom: 16,
                        left: currentLang == 'en' ? 24 : 9,
                        right: currentLang == 'en' ? 9 : 24),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                              width: 143,
                              child: Text(ad.title!,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1)),
                          Gap(12),
                          SizedBox(
                              width: 143,
                              child: Text(ad.subtitle!,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 14),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis)),
                          Gap(16),
                          SizedBox(
                              child: CustomButton(
                                  borderRadius: 100,
                                  onPressed: () {},
                                  text: AppLocalizations.of(context)!.orderNow,
                                  width: 71,
                                  height: 24,
                                  backgroundColor: Colors.white,
                                  textStyle: TextStyle(
                                      color: AppColors.primaryColor,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w700),
                                  padding: EdgeInsets.zero,
                                  margin: EdgeInsets.zero))
                        ])),
                Gap(width < 600
                    ? 20
                    : width > 1000
                        ? 500.w
                        : 280.w),
                CustomCachedNetworkImage(url: ad.image!)
              ])
            ]));
      },
    );
  }
}
