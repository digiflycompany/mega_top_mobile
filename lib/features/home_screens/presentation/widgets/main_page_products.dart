import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/utils/global_cubit.dart';
import 'package:mega_top_mobile/core/utils/global_state.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/core/widgets/no_internet_page.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/adds_list.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/best_seller_list.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/latest_offers_list.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/our_products_row.dart';

class MainPageProducts extends StatelessWidget {
  const MainPageProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GlobalCubit, GlobalState>(
      builder: (context, state) {
        if(state is ProductsNoInternetConnection){
          return Padding(
            padding: EdgeInsets.only(bottom: context.height48),
            child: NoInternetScreen(buttonOnTap: ()=>context.read<GlobalCubit>().getLatestOffers()),
          );
        }
        return Column(
          children: [
            VerticalSpace(context.height*0.008),
            const AdvertisementList(),
            VerticalSpace(context.height*0.04),
            const ViewAllRow(
              bigText: AppStrings.bestSellerEn,
            ),
            const BestSellerList(),
            // const LatestProductsList(),
            VerticalSpace(context.height * 0.0245),
            const ViewAllRow(
              bigText: AppStrings.latestOffersEn,
            ),
            VerticalSpace(context.height * 0.02),
            const LatestOffersList(categoryId: "hW0j2MH1ki"),
            VerticalSpace(context.height * 0.025),
            const ViewAllRow(
              bigText: AppStrings.latestProducts,
            ),
            const LatestOffersList(categoryId: "nUiXlXolmK"),
            VerticalSpace(context.height * 0.02),
          ],
        );
      },
    );
  }
}
