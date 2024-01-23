import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import '../../../../core/utils/app_string.dart';
import '../widgets/primary_app_bar.dart';
import '../widgets/primary_search_bar.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:  PreferredSize(
          preferredSize: Size(double.infinity, context.height*0.089),
          child: const PrimaryAppBar(AppStrings.searchForProductsEn)),
      body:Padding(
        padding:  EdgeInsets.symmetric(horizontal: context.width*0.045),
        child: Column(
          children: [
             VerticalSpace(context.height*0.012),
             const PrimarySearchBar(),
          ],
        ),
      )
    );
  }
}
