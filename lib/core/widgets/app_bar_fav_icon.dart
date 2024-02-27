import 'package:flutter/material.dart';
import 'package:mega_top_mobile/core/utils/app_routes.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/widgets/title_app_bar.dart';
import '../../features/home_screens/presentation/widgets/customer_icon.dart';
import '../utils/app_assets.dart';
import '../utils/app_color.dart';
import '../utils/app_string.dart';

class CustomFavouriteAppBar extends StatelessWidget {
  const CustomFavouriteAppBar(this.text, {super.key});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowAppBarColor,
            offset: Offset(0.0, 4.0),
            blurRadius: 4.0,
          ),
        ],
      ),
      child: AppBar(
        backgroundColor: Colors.white,
        title: Padding(
          padding: EdgeInsets.only(top: context.height * 0.008),
          child: TitleText(text: text),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: context.width * 0.045),
            child: GestureDetector(
              onTap: ()=>Routes.wishListPageRoute.moveTo,
              child: const CustomerIcon(
                icon: AppAssets.favouritesIcon,
                number: AppStrings.oneText,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
