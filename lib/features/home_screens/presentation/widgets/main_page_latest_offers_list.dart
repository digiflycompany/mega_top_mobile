import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/features/home_screens/cubit/latest_offers_cubit.dart';
import 'package:mega_top_mobile/features/home_screens/cubit/latest_offers_state.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/main_page_product_details_screen.dart';
import 'best_seller_container.dart';

class MainPageLatestOffersList extends StatelessWidget {
  const MainPageLatestOffersList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: context.height * 0.5,
        child: BlocBuilder<LatestOffersCubit, LatestOffersState>(
            builder: (context, state) {
          if (state is LatestOffersSuccess) {
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
                                          .read<LatestOffersCubit>()
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
                                                .user.products?[index].title,
                                            quantity: state
                                                .user.products?[index].quantity,
                                            categoryName: state
                                                .user
                                                .products?[index]
                                                .categoryId
                                                .name,
                                            cubit: context
                                                .read<LatestOffersCubit>(),
                                            description: state.user
                                                .products?[index].description,
                                            finalPrice: state.user.products![index].price.finalPrice
                                                .toString(),
                                            originalPrice: state
                                                .user
                                                .products?[index]
                                                .price
                                                .originalPrice
                                                .toString(),
                                            productId:
                                                state.user.products![index].id,
                                            imagePosition: context
                                                .read<LatestOffersCubit>()
                                                .currentImageIndex,
                                            images: state.user.products![index].images!.length == 0
                                                ? context
                                                    .read<LatestOffersCubit>()
                                                    .placeHolderImages!
                                                : state.user.products![index].images!, product: state.user.products![index])));
                              });
                        },
                        separatorBuilder: (context, index) {
                          return Gap(16.w);
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
          } else if (state is LatestOffersLoading) {
            return const ShimmerBestSellerContainer();
          }
          return Container();
        }));
  }
}