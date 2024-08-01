import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/features/account_screens/profile_screen/presentation/cubit/account_details_cubit.dart';
import 'package:mega_top_mobile/features/account_screens/profile_screen/presentation/cubit/account_details_state.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/items_list.dart';

class WishListView extends StatelessWidget {
  const WishListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AccountDetailsCubit, AccountDetailsState>(
      listener: (context, state){},
  builder: (context, state) {
    AccountDetailsCubit cubit = context.read<AccountDetailsCubit>();
    if(state is AccountDetailsSuccess){
        return Expanded(
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: cubit.wishListCount,
            itemBuilder: (BuildContext context, int index) {
              final wishListItem =state.user.data.user.wishlist[index];
              return Padding(
                padding: EdgeInsets.only(right: context.width*0.011,left: context.width*0.011, bottom: context.height*0.027,top: context.height*0.006),
                child: ProductsListContainer(
                  productName: wishListItem.title,
                  productPhoto: wishListItem.images[0],
                  productType: wishListItem.categoryId.name,
                  productPrice: wishListItem.price.finalPrice.toString(),
                  discountPercent: '0',
                  discount: false,
                  icon: AppAssets.favourFilledIcon,
                  onTap: ()=>cubit.removeProductFormWishList(wishListItem.id),
                ),
              );
            },
          ),
        );
    } else {
      return Container();
    }
  },
);
  }
}
