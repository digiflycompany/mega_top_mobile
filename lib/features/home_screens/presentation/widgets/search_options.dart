import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_string.dart';
import '../../../../core/utils/spacer.dart';
import '../../cubit/home_cubit.dart';
import '../../cubit/home_states.dart';
import 'filter_sort_container.dart';
import 'list_grid_container.dart';

class ItemsOptionsRow extends StatelessWidget {
  final double? topPadding;
  final double? bottomPadding;
  const ItemsOptionsRow({
    super.key,
    this.topPadding,
    this.bottomPadding,
  });

  @override
  Widget build(BuildContext context) {
    HomeCubit homeCubit = context.read<HomeCubit>();
    return Padding(
      padding: EdgeInsets.only(top: topPadding!, bottom: bottomPadding!),
      child: Row(
        children: [
          /// List Grid Container ///
          BlocConsumer<HomeCubit, HomeState>(
            listener: (context, state) {},
            builder: (context, state) {
              return ListGridContainer(
                onTap: () {
                  homeCubit.toggleList();
                },
                image:
                    homeCubit.isGrid ? AppAssets.listIcon : AppAssets.gridIcon,
                text: homeCubit.isGrid ? AppStrings.listEn : AppStrings.gridEn,
              );
            },
          ),
          const Spacer(),
          FilterSortContainer(
            icon: AppAssets.sortIcon,
            onTap: () => homeCubit.showSortBottomSheet(context),
          ),
          HorizontalSpace(context.width * 0.022),
          FilterSortContainer(
            icon: AppAssets.filterIcon,
            onTap: () => homeCubit.showFilterBottomSheet(context),

          )
        ],
      ),
    );
  }
}
