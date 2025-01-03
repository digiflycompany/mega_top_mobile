import 'package:flutter/material.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/widgets/custom_search_bar.dart';
import 'customer_information.dart';

class MainPageAppBar extends StatelessWidget {
  const MainPageAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: context.width * 0.045),
            child: const SingleChildScrollView(
                child: Column(children: [CustomerInformation(), CustomSearchBar()]))));
  }
}