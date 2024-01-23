import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/your_latest_search_row.dart';
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
             VerticalSpace(context.height*0.03),
             const YourLatestSearch(),
             VerticalSpace(context.height*0.025),
             Container(
               width: double.infinity,
               height: context.height*0.068,
               decoration: BoxDecoration(
                 color:AppColors.circleAvatarBackground,
                 borderRadius: BorderRadius.circular(context.height*0.006),
               ),
               child: Padding(
                 padding: EdgeInsets.symmetric(horizontal: context.width*0.045),
                 child:  Row(
                   children: [
                     const Text(
                       AppStrings.hardDisk1TbEn,
                       style: TextStyle(
                         color: Colors.black,
                         fontWeight: FontWeight.w600,
                         fontSize: 14,
                       ),
                     ),
                     const Spacer(),
                     SvgPicture.asset(AppAssets.linkIcon)
                   ],
                 ),
               ),
             )
          ],
        ),
      )
    );
  }
}
