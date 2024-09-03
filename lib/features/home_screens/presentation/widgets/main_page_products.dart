import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/core/widgets/no_internet_page.dart';
import 'package:mega_top_mobile/features/home_screens/cubit/latest_offers_cubit.dart';
import 'package:mega_top_mobile/features/home_screens/cubit/latest_offers_state.dart';
import 'package:mega_top_mobile/features/home_screens/cubit/latest_products_cubit.dart';
import 'package:mega_top_mobile/features/home_screens/cubit/latest_products_state.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/best_seller_list.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/main_page_latest_offers_list.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/main_page_latest_products_list.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/our_products_row.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MainPageProducts extends StatelessWidget {
  const MainPageProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LatestProductsCubit, LatestProductsState>(
      builder: (context, state) {
        return BlocBuilder<LatestOffersCubit, LatestOffersState>(
          builder: (context, state) {
            if (state is LatestOffersNoInternetConnection || state is LatestProductsNoInternetConnection) {
              return Padding(
                padding: EdgeInsets.only(bottom: context.height48),
                child: NoInternetScreen(buttonOnTap: () {
                      context.read<LatestOffersCubit>().getLatestOffers();
                      context.read<LatestProductsCubit>().getLatestProducts();
                }),
              );
            }
            return Column(
              children: [
                VerticalSpace(context.height * 0.008),
                // const AdvertisementList(),
                // VerticalSpace(context.height * 0.04),
                ViewAllRow(
                  bigText: AppLocalizations.of(context)!.bestSeller,
                ),
                const BestSellerList(),
                // const LatestProductsList(),
                VerticalSpace(context.height * 0.0245),
                ViewAllRow(
                  bigText: AppLocalizations.of(context)!.latestOffers,
                ),
                VerticalSpace(context.height * 0.02),
                const MainPageLatestOffersList(),
                VerticalSpace(context.height * 0.025),
                ViewAllRow(
                  bigText: AppLocalizations.of(context)!.latestProducts,
                ),
                const MainPageLatestProductList(),
                VerticalSpace(context.height * 0.02),
              ],
            );
          },
        );
      },
    );
  }
}
