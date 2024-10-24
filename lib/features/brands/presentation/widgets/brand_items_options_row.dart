import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/features/brands/cubit/brands_cubit.dart';
import 'package:mega_top_mobile/features/brands/cubit/brands_state.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/filter_sort_container.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/list_grid_container.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BrandItemsOptionsRow extends StatelessWidget {
  final double? topPadding;
  final double? bottomPadding;
  const BrandItemsOptionsRow({
    super.key,
    this.topPadding,
    this.bottomPadding,
  });

  @override
  Widget build(BuildContext context) {
    BrandsCubit cubit = context.read<BrandsCubit>();
    return Padding(
        padding: EdgeInsets.only(top: topPadding!, bottom: bottomPadding!),
        child: Row(children: [
          /// List Grid Container ///
          BlocConsumer<BrandsCubit, BrandsState>(
              listener: (context, state) {},
              builder: (context, state) {
                return ListGridContainer(
                    onTap: () {
                      cubit.toggleList();
                    },
                    image:  cubit.isGrid
                    ? AppAssets.listIcon
                    :
                        AppAssets.gridIcon,
                    text: cubit.isGrid
                    ? AppLocalizations.of(context)!.list
                    :
                        AppLocalizations.of(context)!.grid);
              }),
          const Spacer(),
          FilterSortContainer(
            icon: AppAssets.sortIcon,
            onTap: () => cubit.showSortBottomSheet(context)
          ),
          HorizontalSpace(context.width * 0.022),
          FilterSortContainer(
            icon: AppAssets.filterIcon,
            onTap: () => cubit.showFilterBottomSheet(context))
        ]));
  }
}