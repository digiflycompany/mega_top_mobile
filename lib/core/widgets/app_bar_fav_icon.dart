import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mega_top_mobile/core/widgets/title_app_bar.dart';
import '../../features/home_screens/presentation/widgets/customer_icon.dart';
import '../utils/app_assets.dart';
import '../utils/app_color.dart';
import '../utils/app_string.dart';
import 'app_bar_back_icon.dart';
class CustomFavouriteAppBar extends StatelessWidget {
  const CustomFavouriteAppBar(  this.text, {super.key});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowAppBarColor,
            offset: Offset(0.0, 4.0), // Offset to control the shadow position
            blurRadius: 4.0, // Spread of the shadow
          ),
        ],
      ),
      child: AppBar(
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.only(top: 6),
          child: TitleText(text: text),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: context.width*0.045),
            child: const CustomerIcon(icon: AppAssets.favouritesIcon,number: AppStrings.twelve,),
          ),
        ],
      ),
    );
  }
}