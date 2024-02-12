import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/utils/app_string.dart';
import '../../../../core/widgets/app_bar_fav_icon.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(double.infinity, context.height*0.089),
          child: const CustomFavouriteAppBar(AppStrings.offersEn)),
    );
  }
}
