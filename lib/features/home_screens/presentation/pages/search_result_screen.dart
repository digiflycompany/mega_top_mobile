import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import '../../../../core/utils/app_string.dart';
import '../widgets/primary_app_bar.dart';

class SearchResultPage extends StatelessWidget {
  const SearchResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.circleAvatarBackground,
        appBar:  PreferredSize(
            preferredSize: Size(double.infinity, context.height*0.089),
            child: const PrimaryAppBar(AppStrings.ssdEn)),
        body:Padding(
          padding:  EdgeInsets.symmetric(horizontal: context.width*0.045),
          child:  Column(
            children: [
              VerticalSpace(context.height*0.037),
              const Row(
                children: [
                  Text(
                    AppStrings.resultsCount,
                      style: TextStyle(
                        color: AppColors.blackColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w700
                      ),
                  ),
                  Text(
                    AppStrings.resultsFound,
                    style: TextStyle(
                        color: AppColors.blackColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w600
                    ),
                  ),
                ],
              )
            ],
          ),
        )
    );
  }
}
