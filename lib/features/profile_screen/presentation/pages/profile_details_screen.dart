import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/widgets/app_bar_fav_icon.dart';

class ProfileDetailsScreen extends StatelessWidget {
  const ProfileDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(double.infinity, context.height * 0.089),
          child: const CustomFavouriteAppBar(AppStrings.shoppingCartEn)),
      body: const Column(
        children: [],
      ),
    );
  }
}
