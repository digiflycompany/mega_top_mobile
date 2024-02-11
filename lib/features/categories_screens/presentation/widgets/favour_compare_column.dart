import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:mega_top_mobile/features/categories_screens/presentation/widgets/white_box_icon.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/spacer.dart';
import '../../cubit/category_cubit.dart';

class FavourCompareColumn extends StatelessWidget {
  const FavourCompareColumn({super.key});


  @override
  Widget build(BuildContext context) {
    CategoryCubit categoryCubit = context.read<CategoryCubit>();
    return Align(
      alignment: AlignmentDirectional.topEnd,
      child: Padding(
        padding: EdgeInsets.only(right: context.width * 0.045, top: context.height * 0.010),
        child: Column(
          children: [
            WhiteBoxIcon(
              icon: AppAssets.favourOutlinedIcon,
              onTap: () => categoryCubit.showAddToFavouritesToast(context),
            ),
            VerticalSpace(context.height * 0.012),
            WhiteBoxIcon(
              icon: AppAssets.compareIcon,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}