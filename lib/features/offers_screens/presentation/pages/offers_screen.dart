import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/widgets/empty_response_page.dart';
import 'package:mega_top_mobile/features/offers_screens/cubit/offers_cubit.dart';
import 'package:mega_top_mobile/features/offers_screens/cubit/offers_state.dart';
import 'package:mega_top_mobile/features/offers_screens/presentation/widgets/offers_items_grid.dart';
import 'package:mega_top_mobile/features/offers_screens/presentation/widgets/offers_items_list.dart';
import 'package:mega_top_mobile/features/offers_screens/presentation/widgets/offers_items_options_row.dart';

import '../../../../core/utils/app_string.dart';
import '../../../../core/widgets/app_bar_fav_icon.dart';

class OffersPage extends StatefulWidget {
  const OffersPage({super.key});

  @override
  State<OffersPage> createState() => _OffersPageState();
}

class _OffersPageState extends State<OffersPage> {

  late OffersCubit offersCubit;
  final controller = ScrollController();

  @override
  void initState() {
     offersCubit = context.read<OffersCubit>();
    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.offset) {
        offersCubit.hasMoreProducts = true;
        offersCubit.page++;
        offersCubit.getMoreProduct()
            .then((value){
          if(offersCubit.hasMoreProducts == true)
          {
            offersCubit.selectOption(AppStrings.defaultEn);
          }
          offersCubit.hasMoreProducts = null;
        });

      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                final cubit = context.read<OffersCubit>();
                if (cubit.offerModel != null) {
                  return Expanded(
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      controller: controller,
                      child: Column(
                        children: [
                          offersCubit.isGrid
                              ? const OffersItemsGridView()
                              : const OffersItemsListView(),
                          SizedBox(
                            height: 15.h,
                          ),
                          if (offersCubit.hasMoreProducts == true)
                            Center(child: SizedBox(
                                height: 15.h,
                                width: 15.h,
                                child: CircularProgressIndicator.adaptive())),
                          SizedBox(
                            height: 25.h,
                          ),
                        ],
                      ),
                    ),
                  );

                }else if (cubit.offerModel != null &&
                    state is OffersFailure) {
                  return  EmptyDataPage(
                        icon: AppAssets.emptyCartIcon,
                        bigFontText: 'No Offers Now',
                        smallFontText: 'Sorry we have no offers right now',
                        buttonText: 'Continue Shopping',
                      );
                } else {
                  return Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                }
              },
            ),
          ],
        ),
      ),
      // body: EmptyDataPage(
      //   icon: AppAssets.emptyCartIcon,
      //   bigFontText: 'No Offers Now',
      //   smallFontText: 'Sorry we have no offers right now',
      //   buttonText: 'Continue Shopping',
      // ),
    );
  }

  @override
  void dispose() {
  //  offersCubit.offerModel = null;
    offersCubit.selectOption(AppStrings.defaultEn);
    offersCubit.page = 1;
    offersCubit.minPriceController.clear();
    offersCubit.maxPriceController.clear();
    offersCubit.minPrice = null;
    offersCubit.maxPrice = null;
    super.dispose();
  }
}
