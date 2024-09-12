import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/utils/locale/locale_cubit.dart';
import 'package:mega_top_mobile/features/account_screens/profile_screen/presentation/cubit/account_details_cubit.dart';
import 'package:mega_top_mobile/features/account_screens/profile_screen/presentation/cubit/account_details_state.dart';
import 'package:mega_top_mobile/features/account_screens/wish_list_screen/presentation/widgets/wishList_product_details_screen.dart';
import 'package:mega_top_mobile/features/account_screens/wish_list_screen/presentation/widgets/wish_list_product_container.dart';

class WishListView extends StatelessWidget {
  const WishListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AccountDetailsCubit, AccountDetailsState>(
      listener: (context, state) {},
      //listener: (context, state)=>context.read<AccountDetailsCubit>().handleRemovingFromWishList(context,state),
  builder: (context, state) {
    AccountDetailsCubit cubit = context.read<AccountDetailsCubit>();
    if(state is AccountDetailsSuccess){
        return Expanded(
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: cubit.wishListCount,
            itemBuilder: (BuildContext context, int index) {
              final wishListItem =state.user.data.user.wishlist[index];
              return BlocBuilder<LocaleCubit, Locale>(
                 builder: (context, locale) {
                 return Padding(
                padding: EdgeInsets.only(right: context.width*0.011,left: context.width*0.011, bottom: context.height*0.027,top: context.height*0.006),
                child: WishListProductsContainer(
                  productName: wishListItem.title,
                  productPhoto:  wishListItem.images.length==0?context.read<AccountDetailsCubit>().placeHolderImages![0]:wishListItem.images[0],
                  productType: locale.languageCode == 'en'?wishListItem.categoryId.name:wishListItem.categoryId.nameAr,
                  productPrice: wishListItem.price.finalPrice.toString(),
                  discountPercent: '0',
                  discount: false,
                  icon: AppAssets.favourFilledIcon,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WishListProductDetailsScreen(
                          name: wishListItem.title,
                          quantity:wishListItem.quantity,
                          categoryName: wishListItem.categoryId.name,
                          cubit: context.read<AccountDetailsCubit>(),
                          description: wishListItem.description,
                          finalPrice: wishListItem.price.finalPrice.toString(),
                          originalPrice: wishListItem.price.originalPrice.toString(),
                          productId: wishListItem.id,
                          imagePosition: 0,
                          images: wishListItem.images.length==0?context.read<AccountDetailsCubit>().placeHolderImages:wishListItem.images,
                        ),
                      ),
                    ).then((_) {
                      context.read<AccountDetailsCubit>().getAccountDetails();
                    });
                  },
                  onTapFavourite: ()=>cubit.removeProductFormWishList(wishListItem.id),
                ),
              );
  },
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
