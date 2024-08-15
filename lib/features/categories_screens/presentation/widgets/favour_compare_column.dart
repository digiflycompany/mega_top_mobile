import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/app_routes.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/utils/global_cubit.dart';
import 'package:mega_top_mobile/core/utils/global_state.dart';
import 'package:mega_top_mobile/features/account_screens/profile_screen/data/repositories/account_details_repo.dart';
import 'package:mega_top_mobile/features/account_screens/profile_screen/presentation/cubit/account_details_cubit.dart';
import 'package:mega_top_mobile/features/account_screens/profile_screen/presentation/cubit/account_details_state.dart';
import 'package:mega_top_mobile/features/categories_screens/presentation/widgets/white_box_icon.dart';
import 'package:mega_top_mobile/services/shared_preferences/preferences_helper.dart';

class FavourCompareColumn extends StatelessWidget {
  final String productId;

  const FavourCompareColumn({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    GlobalCubit globalCubit = context.read<GlobalCubit>();
    return BlocProvider(
      create: (context) => AccountDetailsCubit(AccountDetailsRepoImp())..getAccountDetails(),
      child: BlocBuilder<AccountDetailsCubit, AccountDetailsState>(
        builder: (context, state) {
          return BlocConsumer<GlobalCubit, GlobalState>(
            listener: (context, state)=>globalCubit.handleWishListState(context,state),
            builder: (context, state) {
              return Align(
                alignment: AlignmentDirectional.topEnd,
                child: Padding(
                  padding: EdgeInsets.only(
                      right: context.width * 0.045,
                      top: context.height * 0.010),
                  child: Column(
                    children: [
                      WhiteBoxIcon(
                        icon: context.read<AccountDetailsCubit>().isProductInWishlist(productId)
                            ? AppAssets.favourOutlinedIcon
                            : AppAssets.favourFilledIcon,
                        onTap: () async {
                          final token = await PreferencesHelper.getToken();
                          if (token == null) {
                            Routes.signUpOrLoginPageRoute.moveTo;
                          } else {
                            context.read<AccountDetailsCubit>().isProductInWishlist(productId)
                                ? globalCubit.addToWishList(productId)
                                : globalCubit.removeFromWishList(productId);
                            // globalCubit.toggleFavourite();
                          }
                        },
                      ),
                      // VerticalSpace(context.height * 0.012),
                      // WhiteBoxIcon(
                      //   icon: categoryCubit.addedToCompare
                      //       ? AppAssets.compareIcon
                      //       : AppAssets.compareOutlinedIcon,
                      //   onTap: () {
                      //     categoryCubit.addedToCompare
                      //         ? globalCubit.showPrimaryToast(
                      //             context, AppStrings.theProductRemovedFromCompareEn)
                      //         : globalCubit.showPrimaryToast(
                      //             context, AppStrings.theProductAddedToCompareEn);
                      //     categoryCubit.toggleCompare();
                      //   },
                      // ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
