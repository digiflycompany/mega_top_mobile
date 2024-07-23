import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/widgets/available_container.dart';
import 'package:mega_top_mobile/core/widgets/discount_container.dart';
import 'package:mega_top_mobile/features/categories_screens/cubit/category_cubit.dart';
import 'package:mega_top_mobile/features/categories_screens/cubit/category_state.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/app_routes.dart';
import '../../../../core/utils/spacer.dart';

class ProductsGridContainer extends StatelessWidget {
  final int index;

  final String? discountPercent;
  final bool? discount;
  const ProductsGridContainer(
      {super.key,
      required this.index,
      this.discount = false,
      this.discountPercent});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoryCubit, CategoryState>(
      listener: (BuildContext context, CategoryState state) {},
      builder: (BuildContext context, CategoryState state) {
        final cubit = context.read<CategoryCubit>();

        return GestureDetector(
          onTap: () {
            Routes.categoryProductDetailsPageRoute.moveTo;
          },
          child: Container(
            width: context.width * 0.43,
            height: context.height * 0.325,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(context.height * 0.0065),
              boxShadow: const [
                BoxShadow(
                  color: AppColors.containerShadow,
                  offset: Offset(0, 2),
                  blurRadius: 12,
                  spreadRadius: 0,
                ),
              ],
            ),
            child: Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: context.width * 0.022,
                      right: context.width * 0.022,
                      top: context.height * 0.012,
                      bottom: context.height * 0.01,
                    ),
                    child: Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          height: context.height * 0.174,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(context.height * 0.0065),
                            color: AppColors.iconsBackgroundColor,
                          ),
                          child: Padding(
                            padding:
                                EdgeInsets.only(top: context.height * 0.012),
                            child: CachedNetworkImage(
                              imageUrl: cubit.selectedCategoryModel!.data!
                                  .products[index].images[0],
                              width: context.width * 0.2,
                            ),
                          ),
                        ),
                        discount == true
                            ? Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: context.height * 0.012,
                                    horizontal: context.width * 0.022),
                                child: DiscountContainer(
                                  discountPercent: discountPercent,
                                ),
                              )
                            : Container(),
                        Align(
                            alignment: AlignmentDirectional.topEnd,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: context.height * 0.012,
                                  horizontal: context.width * 0.022),
                              child: SvgPicture.asset(
                                AppAssets.favourOutlinedIcon,
                                width: context.width * 0.054,
                              ),
                            )),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: context.width * 0.022,
                        right: context.width * 0.022,
                        bottom: context.height * 0.012),
                    child: Column(
                      children: [
                        Align(
                          alignment: AlignmentDirectional.topStart,
                          child: Text(
                            cubit.selectedCategoryModel!.data!.products[index].title!,
                            maxLines: 2,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                                fontSize: 12.sp),
                          ),
                        ),
                        VerticalSpace(context.height * 0.006),
                        Align(
                          alignment: AlignmentDirectional.topStart,
                          child: Text(
                            cubit.selectedCategoryModel!.data!.products[index].categoryId!.name!,
                            style: TextStyle(
                                color: AppColors.greyTextColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 10.sp),
                          ),
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            const AvailableContainer(),
                            const Spacer(),
                            Text(
                              cubit.selectedCategoryModel!.data!.products[index].price!.finalPrice!.toString(),
                              style: TextStyle(
                                  color: AppColors.primaryColor,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w700),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
