import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/utils/global_cubit.dart';
import 'package:mega_top_mobile/features/categories_screens/cubit/category_cubit.dart';
import 'package:mega_top_mobile/features/categories_screens/cubit/category_state.dart';
import 'package:mega_top_mobile/features/categories_screens/presentation/widgets/white_box_icon.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/spacer.dart';

class FavourCompareColumn extends StatelessWidget {
  const FavourCompareColumn({super.key});

  @override
  Widget build(BuildContext context) {
    CategoryCubit categoryCubit = context.read<CategoryCubit>();
    GlobalCubit globalCubit = context.read<GlobalCubit>();
    return BlocConsumer<CategoryCubit, CategoryState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Align(
          alignment: AlignmentDirectional.topEnd,
          child: Padding(
            padding: EdgeInsets.only(
                right: context.width * 0.045, top: context.height * 0.010),
            child: Column(
              children: [
                WhiteBoxIcon(
                  icon: categoryCubit.addedToFavourites
                      ? AppAssets.favourFilledIcon
                      : AppAssets.favourOutlinedIcon,
                  // icon: categoryCubit
                  //         .selectedCategoriesModel!
                  //         .productList[categoryCubit.selectedProductIndex]
                  //         .wishlist
                  //     ? AppAssets.favourFilledIcon
                  //     : AppAssets.favourOutlinedIcon,
                  onTap: () {
                    categoryCubit.addedToFavourites
                        ? globalCubit.showRemoveFromFavouritesToast(context)
                        : globalCubit.showAddToFavouritesToast(context);
                     categoryCubit.toggleFavourite();

                  },
                ),
                VerticalSpace(context.height * 0.012),
                WhiteBoxIcon(
                  icon: categoryCubit.addedToCompare
                      ? AppAssets.compareIcon
                      : AppAssets.compareOutlinedIcon,
                  onTap: () {
                    categoryCubit.addedToCompare
                        ? globalCubit.showPrimaryToast(
                            context, AppStrings.theProductRemovedFromCompareEn)
                        : globalCubit.showPrimaryToast(
                            context, AppStrings.theProductAddedToCompareEn);
                    categoryCubit.toggleCompare();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
