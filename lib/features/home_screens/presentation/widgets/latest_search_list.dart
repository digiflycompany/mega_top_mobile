import 'package:flutter/cupertino.dart';
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
    return  Expanded(
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: searchTerms.length,
          itemBuilder:(BuildContext context, int index) {
            return  LatestSearchContainer(searchText: searchTerms[index],);
          }
      ),
    );
  }
}
