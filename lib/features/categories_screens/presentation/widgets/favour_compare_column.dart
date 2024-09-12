import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/app_constants.dart';
import 'package:mega_top_mobile/core/utils/app_routes.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/utils/global_cubit.dart';
import 'package:mega_top_mobile/core/utils/global_repo.dart';
import 'package:mega_top_mobile/core/utils/global_state.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/core/widgets/main_page_products_model.dart';
import 'package:mega_top_mobile/features/account_screens/profile_screen/presentation/cubit/account_details_cubit.dart';
import 'package:mega_top_mobile/features/account_screens/profile_screen/presentation/cubit/account_details_state.dart';
import 'package:mega_top_mobile/features/categories_screens/presentation/widgets/white_box_icon.dart';
import 'package:mega_top_mobile/services/shared_preferences/preferences_helper.dart';


class FavourCompareColumn extends StatelessWidget {
  final Product product;
  const FavourCompareColumn({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountDetailsCubit, AccountDetailsState>(
        builder: (context, state) {
      return BlocProvider(
          create: (context) => GlobalCubit(GlobalRepoImp()),
          child: BlocConsumer<GlobalCubit, GlobalState>(
              listener: (context, state) => context
                  .read<GlobalCubit>()
                  .handleWishListState(context, state),
              builder: (context, state) {
                GlobalCubit globalCubit = context.read<GlobalCubit>();
                return Align(
                    alignment: AlignmentDirectional.topEnd,
                    child: Padding(
                        padding: EdgeInsetsDirectional.only(
                            end: context.width * 0.045,
                            top: context.height * 0.010),
                        child: Column(children: [
                          WhiteBoxIcon(
                              icon: PreferencesHelper.isProductInWishlist(
                                          product.id) ==
                                      true
                                  ? AppAssets.favourFilledIcon
                                  : AppAssets.favourOutlinedIcon,
                              onTap: () async {
                                final token =
                                    await PreferencesHelper.getToken();
                                if (token == null) {
                                  Routes.signUpOrLoginPageRoute.moveTo;
                                } else {
                                  if (PreferencesHelper.isProductInWishlist(
                                      product.id) ==
                                      true) {
                                    globalCubit.removeFromWishList(product.id);
                                  } else {
                                    globalCubit.addToWishList(product.id);
                                  }
                                }
                              }),
                          VerticalSpace(context.height * 0.012),
                          WhiteBoxIcon(
                              onTap: () async {
                                final token =
                                await PreferencesHelper.getToken();
                                if (token == null) {
                                  Routes.signUpOrLoginPageRoute.moveTo;
                                } else {
                                  if (PreferencesHelper.isProductInComparisonList(
                                      product.id) ==
                                      true) {
                                    globalCubit.removeFromCompareList(product.id);
                                    AppConstants.showRemoveFromCompareToast(context);
                                  } else {
                                    var compareList = PreferencesHelper.getCompareList();
                                    if(compareList.length > 1) {
                                      AppConstants.showFullCompareListToast(
                                          context);
                                      return ;
                                    }
                                    globalCubit.addProductToCompareList(product);
                                    AppConstants.showAddToCompareToast(context);
                                  }
                                }
                              },
                              icon: PreferencesHelper.isProductInComparisonList(
                                  product.id) ==
                                  true? AppAssets.compareIcon: AppAssets.compareOutlinedIcon)
                        ])));
              }));
    });
  }
}