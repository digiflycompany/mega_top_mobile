import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/adds_list.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/main_page_app_bar.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: PreferredSize(
        preferredSize:Size(double.infinity, context.height*0.19), //width and height
        child: const MainPageAppBar()
      ),
      body:  Padding(
        padding:  EdgeInsets.symmetric(horizontal: context.width*0.045),
        child: Column(
             children: [
               VerticalSpace(context.height*0.022),
               const AdvertisementList(),
               VerticalSpace(context.height*0.04),
               Row(
                 children: [
                   const Text(
                     AppStrings.ourProductsEn,
                     style: TextStyle(
                       color: Colors.black,
                       fontWeight: FontWeight.w700,
                       fontSize: 18
                     ),
                   ),
                   const Text(
                     AppStrings.viewAllEn,
                     style: TextStyle(
                         color: AppColors.primaryColor,
                         fontWeight: FontWeight.w700,
                         fontSize: 14
                     ),
                   ),
                   HorizontalSpace(context.width*0.022),
                 ],
               )
               
             ],
        ),
      ),
    );
  }
}
