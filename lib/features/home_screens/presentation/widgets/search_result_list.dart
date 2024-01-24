import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_string.dart';
import '../../../../core/utils/spacer.dart';
import 'filter_sort_container.dart';
import 'list_grid_container.dart';

class SearchResultList extends StatelessWidget {
  const SearchResultList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
                  const Spacer(),
                  const FilterSortContainer(icon: AppAssets.sortIcon,),
                  HorizontalSpace(context.width*0.022 ),
                  const FilterSortContainer(icon: AppAssets.filterIcon,)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
