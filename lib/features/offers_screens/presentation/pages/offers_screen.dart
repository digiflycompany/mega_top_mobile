import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/features/offers_screens/cubit/offers_cubit.dart';
import 'package:mega_top_mobile/features/offers_screens/cubit/offers_state.dart';
import '../../../../core/utils/app_string.dart';
import '../../../../core/widgets/app_bar_fav_icon.dart';
import '../widgets/offers_items_grid.dart';
import '../widgets/offers_items_list.dart';
import '../widgets/offers_items_options_row.dart';

class OffersPage extends StatelessWidget {
  const OffersPage({super.key});

  @override
  Widget build(BuildContext context) {
    OffersCubit offersCubit = context.read<OffersCubit>();
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(double.infinity, context.height * 0.089),
          child: const CustomFavouriteAppBar(AppStrings.offersEn)),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.width * 0.045),
        child: Column(
          children: [
            OffersItemsOptionsRow(
              topPadding: context.height * 0.028,
              bottomPadding: context.height * 0.033,
            ),
            BlocConsumer<OffersCubit, OffersState>(
              listener: (context, state) {},
              builder: (context, state) {
                return offersCubit.isGrid
                    ? const OffersItemsGridView()
                    : const OffersItemsListView();
              },
            ),
          ],
        ),
      ),
    );
  }
}
