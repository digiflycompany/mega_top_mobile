import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/filter_sort_container.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/list_grid_container.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/search_result_text.dart';
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
        body:Column(
          children: [
            VerticalSpace(context.height*0.028),
            const SearchResult(searchCount: AppStrings.resultsCount,),
            VerticalSpace(context.height*0.028),
            Expanded(
              child: Container(
                width: double.infinity,
                color: Colors.white,
                child: Column(
                  children: [
                    VerticalSpace(context.height*0.028),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal:context.width*0.045 ),
                      child: Row(
                        children: [
                          const ListGridContainer(
                          image: AppAssets.listIcon,
                          text: AppStrings.listEn
                          ,),
                          HorizontalSpace(context.width*0.022 ),
                          const FilterSortContainer(icon: AppAssets.sortIcon,)
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        )
    );
  }
}
