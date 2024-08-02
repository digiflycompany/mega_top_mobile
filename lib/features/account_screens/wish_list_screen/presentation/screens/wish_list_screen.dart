import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/widgets/no_internet_page.dart';
import 'package:mega_top_mobile/core/widgets/product_list_shimmer.dart';
import 'package:mega_top_mobile/features/account_screens/profile_screen/presentation/cubit/account_details_cubit.dart';
import 'package:mega_top_mobile/features/account_screens/profile_screen/presentation/cubit/account_details_state.dart';
import 'package:mega_top_mobile/features/account_screens/wish_list_screen/presentation/widgets/wish_list_count.dart';
import 'package:mega_top_mobile/features/account_screens/wish_list_screen/presentation/widgets/wish_list_list_view.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/widgets/empty_response_page.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/primary_app_bar.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, context.height * 0.089),
        child: const PrimaryAppBar(
          AppStrings.wishListEn,
          favour: false,
        ),
      ),
      body: BlocConsumer<AccountDetailsCubit, AccountDetailsState>(
        listener: (context, state) => context.read<AccountDetailsCubit>().handleRemovingFromWishList(context, state),
        builder: (context, state) {
          return _buildState(context, state);
        },
      ),
    );
  }

  Widget _buildState(BuildContext context, AccountDetailsState state) {
    AccountDetailsCubit cubit = context.read<AccountDetailsCubit>();

    if (state is AccountDetailsSuccess) {
      return _buildSuccessState(context, state);
    } else if (state is AccountDetailsLoading) {
      return _buildLoadingState(context);
    } else if (state is AccountDetailsNoInternetConnection) {
      return _buildNoInternetState(cubit);
    } else {
      return Container();
    }
  }

  Widget _buildSuccessState(BuildContext context, AccountDetailsSuccess state) {
    if (state.user.data.wishlistCount > 0) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: context.width * 0.045),
        child: const Column(
          children: [
            WishListCount(),
            WishListView(),
          ],
        ),
      );
    } else {
      return EmptyDataPage(
        icon: AppAssets.emptyWishListIcon,
        bigFontText: AppStrings.noWishListItemsEn,
        smallFontText: AppStrings.browseProductsFavLongTextEn,
        buttonText: AppStrings.continueShoppingEn,
        buttonOnTap: () {},
      );
    }
  }

  Widget _buildLoadingState(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.width * 0.045),
      child: ProductsListShimmer(),
    );
  }

  Widget _buildNoInternetState(AccountDetailsCubit cubit) {
    return NoInternetScreen(
      buttonOnTap: () {
        cubit.getAccountDetails();
      },
    );
  }
}
