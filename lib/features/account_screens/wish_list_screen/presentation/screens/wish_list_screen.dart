import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/widgets/no_internet_page.dart';
import 'package:mega_top_mobile/core/widgets/product_list_shimmer.dart';
import 'package:mega_top_mobile/features/account_screens/profile_screen/presentation/cubit/account_details_cubit.dart';
import 'package:mega_top_mobile/features/account_screens/profile_screen/presentation/cubit/account_details_state.dart';
import 'package:mega_top_mobile/features/account_screens/wish_list_screen/presentation/widgets/wish_list_count.dart';
import 'package:mega_top_mobile/features/account_screens/wish_list_screen/presentation/widgets/wish_list_list_view.dart';
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
            )),
        body: BlocBuilder<AccountDetailsCubit, AccountDetailsState>(
          builder: (context, state) {
            AccountDetailsCubit cubit = context.read<AccountDetailsCubit>();
            if(state is AccountDetailsSuccess){
              return Padding(
                padding:
                EdgeInsets.symmetric(horizontal: context.width * 0.045),
                child: const Column(
                  children: [
                    WishListCount(),
                    WishListView(),
                  ],
                ),
              );
            }
            else if(state is AccountDetailsLoading){
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal:context.width16),
                    child: ProductsListShimmer(),
                  );
            }
            else if(state is AccountDetailsNoInternetConnection){
              return NoInternetScreen(buttonOnTap: () {
                cubit.getAccountDetails();
              },);
            }
            else {
              return Container();
            }
          },
        ));
  }
}
