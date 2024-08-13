import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/features/categories_screens/cubit/category_cubit.dart';
import 'package:mega_top_mobile/features/categories_screens/cubit/category_state.dart';
import 'package:mega_top_mobile/features/categories_screens/presentation/widgets/category_product_images.dart';
import 'package:mega_top_mobile/features/categories_screens/presentation/widgets/favour_compare_column.dart';
import 'package:mega_top_mobile/features/categories_screens/presentation/widgets/product_images_dots.dart';
import 'package:mega_top_mobile/features/offers_screens/cubit/offers_cubit.dart';
import 'package:mega_top_mobile/features/offers_screens/cubit/offers_state.dart';

import '../utils/app_color.dart';

class ProductDetailedImage extends StatelessWidget {
  const ProductDetailedImage({super.key, required this.images, required this.imagePosition,required this.cubit});

  final List<String> images;
  final int imagePosition;
  final cubit;


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OffersCubit, OffersState>(
      builder: (BuildContext context, OffersState state) {
        final offersCubit = context.read<OffersCubit>();
        return Container(
          width: double.infinity,
          height: context.height * 0.338,
          decoration:
              const BoxDecoration(color: AppColors.onboardingBackgroundColor),
          child: Stack(
            children: [
              Column(
                children: [
                  ProductImages(images: images,cubit: cubit,),
                  SizedBox(
                    height: 10.h,
                  ),
                  // if (offersCubit.offerModel!
                  //     .data!.products[offersCubit.selectedProductIndex].images.length >
                  //     1)
                    if (images.length > 1)
                  ProductImagesDots(imageLength: images.length,imagePosition: imagePosition,),
                ],
              ),
              FavourCompareColumn(),
            ],
          ),
        );
      },
    );
  }
}
