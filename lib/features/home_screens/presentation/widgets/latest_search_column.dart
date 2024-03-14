import 'package:flutter/cupertino.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/your_latest_search_row.dart';
import '../../../../core/utils/spacer.dart';
import 'latest_search_list.dart';

class LatestSearchColumn extends StatelessWidget {
  const LatestSearchColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const YourLatestSearch(),
        VerticalSpace(context.height * 0.025),
        const LatestSearchList(),
      ],
    );
  }
}
