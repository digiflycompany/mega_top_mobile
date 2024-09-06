import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/filter_sort_container.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/list_grid_container.dart';
import 'package:mega_top_mobile/features/offers_screens/cubit/offers_cubit.dart';
import 'package:mega_top_mobile/features/offers_screens/cubit/offers_state.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class OffersItemsOptionsRow extends StatelessWidget {
  final double? topPadding;
  final double? bottomPadding;
  const OffersItemsOptionsRow({
    super.key,
    this.topPadding,
    this.bottomPadding,
  });

  @override
  Widget build(BuildContext context) {
    OffersCubit offersCubit = context.read<OffersCubit>();
    return Padding(
      padding: EdgeInsets.only(top: topPadding!, bottom: bottomPadding!),
      child: Row(
        children: [
          /// List Grid Container ///
          BlocConsumer<OffersCubit, OffersState>(
            listener: (context, state) {},
            builder: (context, state) {
              return ListGridContainer(
                onTap: () {
                  offersCubit.toggleList();
                },
                image: offersCubit.isGrid
                    ? AppAssets.listIcon
                    : AppAssets.gridIcon,
                text:
                    offersCubit.isGrid ? AppLocalizations.of(context)!.list : AppLocalizations.of(context)!.grid,
              );
            },
          ),
          const Spacer(),
          FilterSortContainer(
            icon: AppAssets.sortIcon,
            onTap: () => offersCubit.showSortBottomSheet(context),
          ),
          HorizontalSpace(context.width * 0.022),
          FilterSortContainer(
            icon: AppAssets.filterIcon,
            onTap: () => offersCubit.showFilterBottomSheet(context),
          ),
        ],
      ),
    );
  }
}
