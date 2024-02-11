import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../../../../core/utils/app_string.dart';
import '../../../../core/widgets/app_bar_fav_icon.dart';
import '../../../categories_screens/cubit/category_cubit.dart';
import '../../../categories_screens/cubit/category_state.dart';
import '../../../categories_screens/presentation/widgets/category_items_list.dart';
import '../../../categories_screens/presentation/widgets/category_items_options_row.dart';
import '../widgets/offers_items_grid.dart';

class OffersPage extends StatelessWidget {
  const OffersPage({super.key});

  @override
  Widget build(BuildContext context) {
    CategoryCubit categoryCubit = context.read<CategoryCubit>();
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(double.infinity, context.height * 0.089),
          child: const CustomFavouriteAppBar(AppStrings.offersEn)),
      body:  Padding(
        padding: EdgeInsets.symmetric(horizontal: context.width*0.045),
        child:  Column(
          children: [
            CategoryItemsOptionsRow(topPadding:context.height * 0.028,bottomPadding: context.height * 0.033,),
            BlocConsumer<CategoryCubit, CategoryState>(
              listener: (context, state) {},
              builder: (context, state) {
                return categoryCubit.isGrid?const OffersItemsGridView():const CategoryItemsListView();
              },
            ),
          ],
        ),
      ),
    );
  }
}
