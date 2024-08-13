import 'package:flutter/cupertino.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';

import '../../../../core/utils/app_string.dart';
import 'latest_search_container.dart';

class LatestSearchList extends StatelessWidget {
  const LatestSearchList({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> searchTerms = [
      AppStrings.hardDisk1TbEn,
      AppStrings.ssd256En,
      AppStrings.ram16En,
      AppStrings.graphicsCardEn,
    ];
    return ListView.separated(
        separatorBuilder: (BuildContext context, int index) =>
            VerticalSpace(context.height * 0.006),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: searchTerms.length,
        itemBuilder: (BuildContext context, int index) {
          return LatestSearchContainer(
            searchText: searchTerms[index],
          );
        });
  }
}
