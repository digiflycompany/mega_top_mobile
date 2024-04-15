import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/app_routes.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/features/categories_screens/cubit/category_cubit.dart';
import 'package:mega_top_mobile/features/categories_screens/cubit/category_state.dart';
import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/spacer.dart';

class OurProductsContainer extends StatelessWidget {
  final String? productPhoto;
  final String? productName;
  final String? productQuantity;
  final int? categoryId;
  final int index;
  const OurProductsContainer({
         super.key,
        this.productPhoto,
        this.productName,
        this.productQuantity,
        required this.index,
        this.categoryId});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoryCubit, CategoryState>(
  listener: (context, state) {},
  builder: (context, state) {
    final cubit = CategoryCubit().getCubit(context);
    return GestureDetector(
      onTap: (){
        cubit.getSelectedCategories(cubit.categories[index].id!);
        cubit.selectedCategoryId = categoryId;
        Routes.categoryItemsPageRoute.moveTo;
      },
      child: Container(
        width: context.width * 0.48575,
        height: context.height * 0.098,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(context.height * 0.006),
          boxShadow: const [
            BoxShadow(
              color: AppColors.containerShadow,
              offset: Offset(0, 2),
              blurRadius: 12,
              spreadRadius: 0,
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: context.width * 0.037),
          child: Row(
            children: [
              productPhoto.isNotNull
                  ? CachedNetworkImage(
                imageUrl: productPhoto!,
                width: context.width * 0.13,
                placeholder: (context, url) => Center(
                  child: Theme(
                    data: Theme.of(context).copyWith(
                      colorScheme: ColorScheme.fromSwatch().copyWith(
                        primary: AppColors.primaryColor,
                      ),
                    ),
                    child: Transform.scale(
                        scale: 0.6,
                        child: CircularProgressIndicator.adaptive()),
                  ),
                ),
                errorWidget: (context, url, error) =>
                    Icon(Icons.error),
              ):Image.asset("assets/images/ad.png",width: context.width * 0.13,),
              //Image.asset(productPhoto!, width: context.width * 0.13),
              HorizontalSpace(context.width * 0.02),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: context.height * 0.02),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        productName!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w700),
                      ),
                      const Spacer(),
                      Text(
                        productQuantity!,
                        style: TextStyle(
                            color: AppColors.greyTextColor,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  },
);
  }
}
