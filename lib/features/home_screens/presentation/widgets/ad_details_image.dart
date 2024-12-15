import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/services/shared_preferences/preferences_helper.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/widgets/main_page_products_model.dart'
    as productModel;
import 'package:mega_top_mobile/core/widgets/main_page_products_model.dart';
import 'package:mega_top_mobile/features/categories_screens/presentation/widgets/favour_compare_column.dart';
import 'package:mega_top_mobile/features/home_screens/data/models/ad_details_model.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/ad_images.dart';

class AdDetailsImage extends StatelessWidget {
  const AdDetailsImage({super.key, required this.ad});
  final AdDetailsData ad;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: context.height * 0.338,
        decoration:
            const BoxDecoration(color: AppColors.onboardingBackgroundColor),
        child: Stack(children: [
          Column(
              children: [AdImages(images: ad.images), SizedBox(height: 10.h)]),
          FutureBuilder<String?>(
              future: PreferencesHelper.getToken(),
              builder: (context, snapshot) {
                final token = snapshot.data;
                final isUserLoggedIn = token != null;
                if (isUserLoggedIn) {
                  return Builder(
                      builder: (context) => FavourCompareColumn(
                          product: Product(
                              id: ad.id!,
                              title: ad.title!,
                              titleAr: ad.titleAr!,
                              description: ad.description!,
                              quantity: ad.quantity ?? 1,
                              categoryId: productModel.Category(
                                  id: ad.categoryId?.id ?? '',
                                  name: ad.categoryId?.name ?? '',
                                  nameAr: ''),
                              subcategoryId: ad.subcategoryId
                                      ?.map((element) => SubCategory(
                                          id: element.id ?? '',
                                          name: element.name ?? '',
                                          nameAr: element.nameAr ?? ''))
                                      .toList() ??
                                  [],
                              price: productModel.Price(
                                  originalPrice: int.tryParse(ad.price!.originalPrice.toString()) ??
                                      0,
                                  finalPrice: int.tryParse(ad.price!.finalPrice.toString()) ??
                                      0),
                              currency: ad.currency!,
                              images: ad.images,
                              unitsSold: ad.unitsSold!,
                              addedBy: productModel.AddedBy(
                                  id: ad.addedBy?.id ?? '',
                                  fullName: ad.addedBy?.fullName ?? '',
                                  email: ad.addedBy?.email ?? ''),
                              active: ad.active!,
                              createdAt: ad.createdAt.toString(),
                              updatedAt: ad.updatedAt.toString(),
                              v: ad.v!)));
                } else {
                  return Container();
                }
              })
        ]));
  }
}