import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/app_string.dart';
import '../../../../core/utils/spacer.dart';
import '../../../../core/widgets/app_bar_fav_icon.dart';
import '../widgets/cart_screen_address.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.circleAvatarBackground,
      appBar: PreferredSize(
          preferredSize: Size(double.infinity, context.height*0.089),
          child: const CustomFavouriteAppBar(AppStrings.shoppingCartEn)),
      body: Column(
        children: [
          VerticalSpace(context.height*0.028),
          const CartScreenAddress(),
          VerticalSpace(context.height*0.028),
        ],
      ),
    );
  }
}
