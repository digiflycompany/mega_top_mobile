import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/widgets/empty_response_page.dart';

import '../../../../../core/utils/app_string.dart';
import '../../../../home_screens/presentation/widgets/primary_app_bar.dart';

class CompareScreen extends StatelessWidget {
  final bool isEmpty = true;
  const CompareScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(double.infinity, context.height * 0.089),
          child: const PrimaryAppBar(
            AppStrings.compareProducts,
            favour: false,
          )),
      body: isEmpty?const EmptyDataPage(
        icon: AppAssets.emptyCompareIcon,
        bigFontText: AppStrings.noProductAddedToCompareEn,
        smallFontText: AppStrings.emptyComparePageDescriptionEn,
        buttonText: AppStrings.continueShoppingEn,
      ):const Column(
        children: [

        ],
      )
    );
  }
}
