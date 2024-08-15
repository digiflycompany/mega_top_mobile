import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/utils/global_cubit.dart';
import 'package:mega_top_mobile/core/utils/global_state.dart';
import 'best_seller_container.dart';

class BestSellerList extends StatelessWidget {
  const BestSellerList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.width * 0.03),
      child: SizedBox(
        height: context.height * 0.5,
        child: BlocBuilder<GlobalCubit,GlobalState>(
          builder: (context,state) {
            if(state is LatestOffersSuccess){
              return Row(
                children: [
                  Expanded(
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return BestSellerContainer(
                            productName: state.user.products![index].title,
                            productPhoto: state.user.products![index].images[0],
                            productType: state.user.products![index].categoryId.name,
                            productPrice: state.user.products![index].price.finalPrice.toString(),
                            onTap: () {
                              // cubit.selectedCategoryId =
                              // cubit.categories!.data!.categories![index].id!;
                              // cubit.setCategoryProductIndex(
                              //     selectedProductIndex: index);
                              // cubit.getSelectedCategories(cubit.selectedCategoryId!);
                              // cubit.getSubCategories(cubit.selectedCategoryId!).then((
                              //     onValue) {
                              //   cubit.initializeCheckboxes(
                              //       cubit.subCategoriesModel!.data!.subcategories
                              //           .length);
                              // });
                              // Routes.categoryItemsPageRoute.moveTo;
                            },
                          );
                        }, separatorBuilder: (context, index) {
                      return SizedBox(
                        width: 0.w,
                      );
                    }, itemCount: 5),
                  )
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
            }else if(state is LatestOffersLoading){
              return const ShimmerBestSellerContainer();
            }
           return Container();
          },
        ),
      ),
    );
  }
}
