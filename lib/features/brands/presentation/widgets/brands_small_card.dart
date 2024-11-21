import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/features/brands/cubit/brands_cubit.dart';
import 'package:mega_top_mobile/features/brands/cubit/brands_state.dart';
import 'package:mega_top_mobile/features/brands/data/models/brands_response.dart';
import 'package:mega_top_mobile/features/brands/presentation/pages/brand_products_page.dart';

class BrandsSmallCard extends StatelessWidget {
  final Brand brand;

  const BrandsSmallCard({super.key, required this.brand});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BrandsCubit, BrandsState>(
        listener: (BuildContext context, BrandsState state) {},
        builder: (BuildContext context, BrandsState state) {
          final cubit = BrandsCubit.get(context);
          return GestureDetector(
              onTap: () {
                cubit.selectBrand(brand);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) =>
                            BrandProductsPage(brandName: brand.name ?? '')));
                cubit.getBrandProducts();
              },
              child: Container(
                  width: context.width * 0.24,
                  height: context.height * 0.131,
                  decoration: BoxDecoration(
                      color: AppColors.iconsBackgroundColor,
                      border: Border.all(
                          width: context.width * 0.002,
                          color: AppColors.onboardingBackgroundColor),
                      borderRadius:
                          BorderRadius.circular(context.height * 0.006)),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child: CachedNetworkImage(
                                imageUrl: brand.name!,
                                fit: BoxFit.contain,
                                width: double.infinity,
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error))),
                        Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: context.height * 0.005,
                                horizontal: context.width * 0.021),
                            child: Text(brand.name!,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 13.sp)))
                      ])));
        });
  }
}