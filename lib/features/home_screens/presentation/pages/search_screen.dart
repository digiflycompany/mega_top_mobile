import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/utils/app_string.dart';
import '../widgets/primary_app_bar.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: Size(double.infinity, context.height*0.087),
          child: const PrimaryAppBar(AppStrings.searchForProductsEn)),
      body: const Center(
        child: Text(
          'Search Page'
        ),
      ),
    );
  }
}
