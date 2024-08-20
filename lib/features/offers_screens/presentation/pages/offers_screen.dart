import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/widgets/no_internet_page.dart';
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
        offersCubit.getMoreProduct().then((value) {
          if (offersCubit.hasMoreProducts == true) {
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
      body: BlocConsumer<OffersCubit,OffersState>(
        listener: (BuildContext context, OffersState state) {
          if (state is OffersMoreProductNoInternetConnection) {
            context.read<OffersCubit>().page--;
            Fluttertoast.showToast(msg: AppStrings.pleaseCheckYourInternet);
          }
        },
        builder: (BuildContext context, OffersState state) {
          final cubit = context.read<OffersCubit>();
          if (state is OffersNoInternetConnection ) {
            return NoInternetScreen(buttonOnTap: () {
              cubit.getOffers();
            });
          }else if(cubit.offerModel.isNull)
            {
              return Center(
                child: Theme(
                  data: Theme.of(context).copyWith(
                    colorScheme: ColorScheme.fromSwatch().copyWith(
                      primary: AppColors.primaryColor,
                    ),
                  ),
                  child: CircularProgressIndicator.adaptive(),
                ),
              );
            }else if(cubit.offerModel!.data!.products.length > 0){
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: context.width * 0.045),
              child: Column(
                children: [
                  OffersItemsOptionsRow(
                    topPadding: context.height * 0.028,
                    bottomPadding: context.height * 0.033,
                  ),
                  Expanded(
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
                            Center(
                                child: SizedBox(
                                    height: 15.h,
                                    width: 15.h,
                                    child: CircularProgressIndicator.adaptive())),
                          SizedBox(
                            height: 25.h,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }else if (cubit.offerModel!.data!.products.length == 0){
            return EmptyDataPage(
              icon: AppAssets.emptyNotificationsIcon,
              bigFontText: AppStrings.noProductsEn,
              smallFontText: AppStrings.noProductListItemsEn,
            );
          }else {
            return Center(
              child: Text(
                AppStrings.serverError,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 14.sp),
              ),
            );
          }
        },
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
