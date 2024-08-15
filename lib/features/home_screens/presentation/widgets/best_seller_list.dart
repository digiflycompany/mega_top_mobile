import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/app_routes.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/features/categories_screens/cubit/category_cubit.dart';
import 'package:mega_top_mobile/features/categories_screens/cubit/category_state.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_string.dart';
import '../../../../core/utils/spacer.dart';
import 'best_seller_container.dart';

class BestSellerList extends StatelessWidget {
  const BestSellerList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.width * 0.03),
      child: SizedBox(
        height: context.height * 0.485,
        child: BlocProvider<CategoryCubit>(
          create: (BuildContext context)=> CategoryCubit()..getSelectedCategories("ZicQSyRrw7"),
          child: BlocBuilder<CategoryCubit,CategoryState>(
            builder: (BuildContext context, CategoryState state) {
              final cubit = context.read<CategoryCubit>();
              return Row(
                children: [
                  Expanded(
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context,index){
                          return BestSellerContainer(
                            productName: cubit.selectedCategoryModel!.data!
                                .products[index].title,
                            productPhoto: cubit.selectedCategoryModel!.data!
                                .products[index].images[0],
                            productType: cubit.selectedCategoryModel!.data!
                                .products[index].categoryId!.name!,
                            productPrice: cubit.selectedCategoryModel!.data!
                                .products[index].price!.finalPrice!
                                .toString(),
                            onTap: (){
                              cubit.selectedCategoryId = cubit.categories!.data!.categories![index].id!;
                              cubit.setCategoryProductIndex(selectedProductIndex: index);
                              cubit.getSelectedCategories(cubit.selectedCategoryId!);
                              cubit.getSubCategories(cubit.selectedCategoryId!).then((onValue){
                                cubit.initializeCheckboxes(cubit.subCategoriesModel!.data!.subcategories.length);
                              });
                              Routes.categoryItemsPageRoute.moveTo;
                            },
                          );
                        }, separatorBuilder: (context,index){
                      return SizedBox(
                        width: 10.w,
                      );
                    }, itemCount: 4),
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
            },
          ),
        ),
      ),
    );
  }
}
