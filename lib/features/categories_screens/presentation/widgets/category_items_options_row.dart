import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/features/categories_screens/cubit/category_cubit.dart';
import 'package:mega_top_mobile/features/categories_screens/cubit/category_state.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/filter_sort_container.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/list_grid_container.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CategoryItemsOptionsRow extends StatelessWidget {
  final double? topPadding;
  final double? bottomPadding;
  const CategoryItemsOptionsRow({
    super.key,
    this.topPadding,
    this.bottomPadding,
  });

  @override
  Widget build(BuildContext context) {
    CategoryCubit categoryCubit = context.read<CategoryCubit>();
    return Padding(
        padding: EdgeInsets.only(top: topPadding!, bottom: bottomPadding!),
        child: Row(children: [
          /// List Grid Container ///
          BlocConsumer<CategoryCubit, CategoryState>(
            listener: (context, state) {},
            builder: (context, state) {
              return ListGridContainer(
                onTap: () {
                  categoryCubit.toggleList();
                },
                image: categoryCubit.isGrid
                    ? AppAssets.listIcon
                    : AppAssets.gridIcon,
                text: categoryCubit.isGrid
                    ? AppLocalizations.of(context)!.list
                    : AppLocalizations.of(context)!.grid,
                // image: AppAssets.gridIcon,
                // text: AppStrings.gridEn,
              );
            },
          ),
          const Spacer(),
          FilterSortContainer(
            icon: AppAssets.sortIcon,
            onTap: () => categoryCubit.showSortBottomSheet(context),
          ),
          HorizontalSpace(context.width * 0.022),
          FilterSortContainer(
              icon: AppAssets.filterIcon,
              onTap: () => categoryCubit.showFilterBottomSheet(context))
        ]));
  }
}