import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/features/home_screens/cubit/home_cubit.dart';
import 'package:mega_top_mobile/features/home_screens/cubit/home_states.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/latest_offer_container.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/spacer.dart';

class LatestOffersList extends StatelessWidget {
  const LatestOffersList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (BuildContext context, HomeState state) {},
      builder: (BuildContext context, HomeState state) {
        final homeCubit = context.read<HomeCubit>();
        if (homeCubit.latestOfferModel.isNotNull) {
          return SizedBox(
            height: context.height * 0.326,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    AppAssets.upsOffers,
                    width: context.width * 0.7,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: context.height * 0.022,
                        bottom: context.height * 0.033),
                    child: Column(
                      children: [
                        LatestOffersContainer(
                          productPhoto: homeCubit
                              .latestOfferModel!.latestOfferList[0].image,
                          productName: homeCubit
                              .latestOfferModel!.latestOfferList[0].name,
                        ),
                        Spacer(),
                        LatestOffersContainer(
                          productPhoto: homeCubit
                              .latestOfferModel!.latestOfferList[1].image,
                          productName: homeCubit
                              .latestOfferModel!.latestOfferList[1].name,
                        ),
                      ],
                    ),
                  ),
                  HorizontalSpace(context.height * 0.022),
                  Padding(
                    padding: EdgeInsets.only(
                        top: context.height * 0.025,
                        bottom: context.height * 0.03),
                    child: Column(
                      children: [
                        LatestOffersContainer(
                          productPhoto: homeCubit
                              .latestOfferModel!.latestOfferList[2].image,
                          productName: homeCubit
                              .latestOfferModel!.latestOfferList[2].name,
                        ),
                        Spacer(),
                        LatestOffersContainer(
                          productPhoto: homeCubit
                              .latestOfferModel!.latestOfferList[3].image,
                          productName: homeCubit
                              .latestOfferModel!.latestOfferList[3].name,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
