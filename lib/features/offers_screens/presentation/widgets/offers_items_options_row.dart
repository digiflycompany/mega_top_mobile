import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:mega_top_mobile/features/offers_screens/cubit/offers_state.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_string.dart';
import '../../../../core/utils/spacer.dart';
import '../../../home_screens/presentation/widgets/filter_sort_container.dart';
import '../../../home_screens/presentation/widgets/list_grid_container.dart';
import '../../cubit/offers_cubit.dart';

class OffersItemsOptionsRow extends StatelessWidget {
  final double? topPadding;
  final double? bottomPadding;
  const OffersItemsOptionsRow({super.key, this.topPadding, this.bottomPadding, });

  @override
  Widget build(BuildContext context) {
    OffersCubit offersCubit = context.read<OffersCubit>();
    return Padding(
      padding:  EdgeInsets.only(top:topPadding!,bottom: bottomPadding!),
      child: Row(
        children: [
          /// List Grid Container ///
          BlocConsumer<OffersCubit, OffersState>(
            listener: (context, state) {},
            builder: (context, state) {
              return ListGridContainer(
                onTap: (){
                  offersCubit.toggleList();
                },
                image:offersCubit.isGrid? AppAssets.listIcon:AppAssets.gridIcon,
                text: offersCubit.isGrid? AppStrings.listEn:AppStrings.gridEn
                ,);
            },
          ),
          const Spacer(),
          FilterSortContainer(icon: AppAssets.sortIcon,onTap: () =>offersCubit.showSortBottomSheet(context),),
          HorizontalSpace(context.width * 0.022),
          FilterSortContainer(icon: AppAssets.filterIcon,onTap: () =>offersCubit.showFilterBottomSheet(context),),
        ],
      ),
    );
  }
}
