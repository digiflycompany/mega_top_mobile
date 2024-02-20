import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import '../../../../core/utils/app_string.dart';
import '../../../cart_screens/presentation/widgets/empty_response_page.dart';
import '../../../home_screens/presentation/widgets/primary_app_bar.dart';

class WishListPage extends StatelessWidget {
  const WishListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(double.infinity, context.height * 0.089),
          child: const PrimaryAppBar(
            AppStrings.wishListEn,
            favour: false,
          )),
      body: const Column(
        children: [

        ],
      )
    );
  }
}
