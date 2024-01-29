import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:mega_top_mobile/features/home_screens/cubit/home_cubit.dart';
import 'package:mega_top_mobile/features/home_screens/cubit/home_states.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_string.dart';
import '../../../../core/utils/spacer.dart';
import 'filter_sort_container.dart';
import 'list_grid_container.dart';

class SearchResultList extends StatelessWidget {
  const SearchResultList({super.key});

  @override
  Widget build(BuildContext context) {
    HomeCubit homeCubit = context.read<HomeCubit>();
    return Expanded(
      child: Container(
        width: double.infinity,
        color: Colors.white,
        child: Column(
          children: [
            VerticalSpace(context.height * 0.028),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: context.width * 0.045),
              child: Row(
                children: [
                  /// List Grid Container ///
                  BlocConsumer<HomeCubit, HomeState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    return ListGridContainer(
                      onTap: (){
                        homeCubit.toggleList();
                      },
                      image:homeCubit.isGrid? AppAssets.listIcon:AppAssets.gridIcon,
                      text: homeCubit.isGrid? AppStrings.listEn:AppStrings.gridEn
                      ,);
                  },
                                    ),
                  const Spacer(),
                  const FilterSortContainer(icon: AppAssets.sortIcon,),
                  HorizontalSpace(context.width * 0.022),
                  const FilterSortContainer(icon: AppAssets.filterIcon,)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
