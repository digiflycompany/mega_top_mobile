import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/app_routes.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/features/categories_screens/cubit/category_cubit.dart';
import 'package:mega_top_mobile/features/categories_screens/cubit/category_state.dart';

class CategoriesSmallCard extends StatelessWidget {
  final String? categoryId;
  final int index;
  final String? categoryPhoto;
  final String? categoryName;

  const CategoriesSmallCard({
    super.key,
    this.categoryPhoto,
    this.categoryName,
    required this.categoryId,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoryCubit, CategoryState>(
      listener: (BuildContext context, CategoryState state) {},
      builder: (BuildContext context, CategoryState state) {
        final cubit = CategoryCubit().getCubit(context);
        return GestureDetector(
          onTap: () {
            cubit.selectedCategoryId = cubit.categories!.data!.categories![index].id!;
            cubit.setCategoryProductIndex(selectedProductIndex: index);
            cubit.getSelectedCategories(cubit.selectedCategoryId!);
            Routes.categoryItemsPageRoute.moveTo;
          },
          child: Container(
            width: context.width * 0.24,
            height: context.height * 0.131,
            decoration: BoxDecoration(
              color: AppColors.iconsBackgroundColor,
              border: Border.all(
                  width: context.width * 0.002,
                  color: AppColors.onboardingBackgroundColor),
              borderRadius: BorderRadius.circular(context.height * 0.006),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: context.height * 0.011,
                  horizontal: context.width * 0.021),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  categoryPhoto.isNotNull
                      ? Expanded(
                          child: CachedNetworkImage(
                            imageUrl: categoryPhoto!,
                            width: context.width * 0.15,
                            // placeholder: (context, url) => Center(
                            //   child: Theme(
                            //     data: Theme.of(context).copyWith(
                            //       colorScheme:
                            //           ColorScheme.fromSwatch().copyWith(
                            //         primary: AppColors.primaryColor,
                            //       ),
                            //     ),
                            //     child: Transform.scale(
                            //         scale: 0.6,
                            //         child:
                            //             CircularProgressIndicator.adaptive()),
                            //   ),
                            // ),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
                        )
                      : Image.asset("assets/images/ad.png"),
                  Text(
                    categoryName!,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 13.sp,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
