import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mega_top_mobile/features/categories_screens/presentation/widgets/white_box_icon.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/spacer.dart';

class FavourCompareColumn extends StatelessWidget {
  const FavourCompareColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.topEnd,
      child: Padding(
        padding:  EdgeInsets.only(right: context.width*0.045),
        child: Column(
          children: [
            const WhiteBoxIcon(icon: AppAssets.favourOutlinedIcon,),
            VerticalSpace(context.height*0.012),
            const WhiteBoxIcon(icon: AppAssets.compareIcon,),
          ],
        ),
      ),
    );
  }
}
