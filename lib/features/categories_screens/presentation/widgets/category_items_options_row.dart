import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:mega_top_mobile/features/categories_screens/cubit/category_cubit.dart';
import 'package:mega_top_mobile/features/categories_screens/cubit/category_state.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_string.dart';
import '../../../../core/utils/spacer.dart';
import '../../../home_screens/presentation/widgets/filter_sort_container.dart';
import '../../../home_screens/presentation/widgets/list_grid_container.dart';

class CategoryItemsOptionsRow extends StatelessWidget {
  final double? topPadding;
  final double? bottomPadding;
  const CategoryItemsOptionsRow({super.key, this.topPadding, this.bottomPadding, });

  @override
  Widget build(BuildContext context) {
    CategoryCubit categoryCubit = context.read<CategoryCubit>();
    return Padding(
      padding:  EdgeInsets.only(top:topPadding!,bottom: bottomPadding!),
      child: Row(
        children: [
          /// List Grid Container ///
          BlocConsumer<CategoryCubit, CategoryState>(
            listener: (context, state) {},
            builder: (context, state) {
              return ListGridContainer(
                onTap: (){
                  categoryCubit.toggleList();
                },
                image:categoryCubit.isGrid? AppAssets.listIcon:AppAssets.gridIcon,
                text: categoryCubit.isGrid? AppStrings.listEn:AppStrings.gridEn
                ,);
            },
          ),
          const Spacer(),
          const FilterSortContainer(icon: AppAssets.sortIcon,),
          HorizontalSpace(context.width * 0.022),
          const FilterSortContainer(icon: AppAssets.filterIcon,)
        ],
      ),
    );
  }
}
