import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/features/home_screens/cubit/latest_products_cubit.dart';
import 'package:mega_top_mobile/features/home_screens/cubit/latest_products_state.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/main_page_product_details_screen.dart';
import 'best_seller_container.dart';

class MainPageLatestProductList extends StatelessWidget {
  const MainPageLatestProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: context.height * 0.5,
        child: BlocBuilder<LatestProductsCubit, LatestProductsState>(
            builder: (context, state) {
          if (state is LatestProductsSuccess) {
            return Row(
              children: [
                Expanded(
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return BestSellerContainer(
                              productName: state.user.products![index].title,
                              productPhoto:
                                  state.user.products![index].images!.length ==
                                          0
                                      ? context
                                          .read<LatestProductsCubit>()
                                          .placeHolderImages![0]
                                      : state.user.products![index].images![0],
                              productType:
                                  state.user.products![index].categoryId.name,
                              productPrice: state
                                  .user.products![index].price.finalPrice
                                  .toString(),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MainPageProductDetailsScreen(
                                            name: state
                                                .user.products![index].title,
                                            quantity: state
                                                .user.products![index].quantity,
                                            categoryName: state
                                                .user
                                                .products![index]
                                                .categoryId
                                                .name,
                                            cubit: context
                                                .read<LatestProductsCubit>(),
                                            description: state.user
                                                .products![index].description,
                                            finalPrice: state
                                                .user
                                                .products![index]
                                                .price
                                                .finalPrice
                                                .toString(),
                                            originalPrice: state
                                                .user
                                                .products![index]
                                                .price
                                                .originalPrice
                                                .toString(),
                                            productId:
                                                state.user.products![index].id,
                                            imagePosition: context
                                                .read<LatestProductsCubit>()
                                                .currentImageIndex,
                                            images: state.user.products![index].images!.length == 0
                                                ? context
                                                    .read<LatestProductsCubit>()
                                                    .placeHolderImages!
                                                : state.user.products![index].images!,
                                            product: state.user.products![index])));
                              });
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(width: 0.w);
                        },
                        itemCount: 5))
              ],
              // children: [
              //   const BestSellerContainer(
              //     productName: AppStrings.hardDiskEn,
              //     productPhoto: AppAssets.hardDiskImage,
              //     productType: AppStrings.storageUnitsEn,
              //     productPrice: AppStrings.le1500,
              //     discountPercent: AppStrings.discountPercentEn,
              //     discount: true,
              //   ),
              //   HorizontalSpace(context.width * 0.045),
              //   const BestSellerContainer(
              //     productName: AppStrings.hardDiskEn,
              //     productPhoto: AppAssets.hardDiskImage,
              //     productType: AppStrings.storageUnitsEn,
              //     productPrice: AppStrings.le1500,
              //   ),
              //   HorizontalSpace(context.width * 0.045),
              //   const BestSellerContainer(
              //     productName: AppStrings.hardDiskEn,
              //     productPhoto: AppAssets.hardDiskImage,
              //     productType: AppStrings.storageUnitsEn,
              //     productPrice: AppStrings.le1500,
              //   ),
              // ],
            );
          } else if (state is LatestProductsLoading) {
            return const ShimmerBestSellerContainer();
          }
          return Container();
        }));
  }
}