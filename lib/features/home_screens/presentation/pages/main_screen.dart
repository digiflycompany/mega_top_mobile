import 'package:flutter/material.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/main_page_app_bar.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/main_page_products.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
            preferredSize:
                Size(double.infinity, context.height * 0.19), //width and height
            child: const MainPageAppBar()),
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: context.width * 0.045),
            child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: MainPageProducts())));
  }
}