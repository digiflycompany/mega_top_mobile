import 'package:flutter/material.dart';
//import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/widgets/button_bottom_nav_bar.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/widgets/cart_checkout_button.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/widgets/cart_items_list.dart';
//import 'package:mega_top_mobile/features/categories_screens/cubit/category_cubit.dart';
//import 'package:mega_top_mobile/services/shared_preferences/preferences_helper.dart';
import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/app_routes.dart';
import '../../../../core/utils/app_string.dart';
import '../../../../core/utils/spacer.dart';
import '../../../../core/widgets/app_bar_fav_icon.dart';
import '../widgets/cart_screen_address.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  // void initState() {
  //   // TODO: implement initState
  //   var cubit = context.read<CategoryCubit>();
  //   HomeCubit homeCubit = context.read<HomeCubit>();
  //   cubit.getMyOrders(homeCubit.userDetails!.userId!);
  //   super.initState();
  // }
  void initState() {
    super.initState();  // Call `super.initState()` first as best practice.
    //var cubit = context.read<CategoryCubit>();
    //HomeCubit homeCubit = context.read<HomeCubit>();

    // Check if userDetails and userId are not null before using them.
    // int? userId = PreferencesHelper.getID;
    // if (userId != null) {
    //   cubit.getMyOrders(userId);
    // } else {
    //   debugPrint('User details or User ID is null');
    // }
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.circleAvatarBackground,
      appBar: PreferredSize(
          preferredSize: Size(double.infinity, context.height * 0.089),
          child: const CustomFavouriteAppBar(AppStrings.shoppingCartEn)),
      body: Column(
        children: [
          VerticalSpace(context.height * 0.028),
          const CartScreenAddress(),
          VerticalSpace(context.height * 0.028),
          Expanded(
              child: Container(
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: context.width * 0.045),
              child: Column(
                children: [
                  // VerticalSpace(context.height * 0.028),
                  // const ShipmentQuantityRow(),
                  VerticalSpace(context.height * 0.033),
                  const CartItemsListView(),
                ],
              ),
            ),
          )),
        ],
      ),
      bottomNavigationBar: ButtonBottomNavBar(
        button: CartCheckoutButton(
          onTap: () => Routes.orderConfirmationPageRoute.moveTo,
        ),
      ),
    );
  }
}
