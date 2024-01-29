import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/search_options.dart';
import '../../../../core/utils/spacer.dart';

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
            const SearchOptionsRow(),
            VerticalSpace(context.height*0.033),
          ],
        ),
      ),
    );
  }
}
