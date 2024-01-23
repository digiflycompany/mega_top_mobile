import 'package:flutter/cupertino.dart';
import '../../../../core/utils/app_string.dart';
import 'latest_search_container.dart';

class LatestSearchList extends StatelessWidget {
  const LatestSearchList({super.key});

  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: ListView.builder(
          itemCount: 4,
          itemBuilder:(BuildContext context, int index) {
            return const LatestSearchContainer(searchText: AppStrings.hardDisk1TbEn,);
          }
      ),
    );
  }
}
