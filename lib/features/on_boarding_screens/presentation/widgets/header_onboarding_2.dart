import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mega_top_mobile/core/utils/media_query.dart';
import 'package:mega_top_mobile/core/widgets/back_arrow_icon.dart';
import 'package:mega_top_mobile/features/on_boarding_screens/presentation/widgets/curved_container.dart';
import 'package:mega_top_mobile/features/on_boarding_screens/presentation/widgets/skip_text.dart';
import '../../../../core/utils/app_assets.dart';

class SecondHeader extends StatelessWidget {
  final PageController pageController;
  const SecondHeader({super.key, required this.pageController});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        /// BackGroundImage ///
        const CurvedContainer(),
        Padding(
          padding:  EdgeInsets.only(top:context.height*0.1),
          child: Transform.scale(
              scale: 0.7,
              child: Image.asset(AppAssets.boardingCart)),
        ),
        Align(
          alignment: AlignmentDirectional.centerEnd,
          child: Padding(
            padding:  EdgeInsets.only(top: context.width*0.12,right: context.width*0.045),
            child: const BackArrow(),
          ),
        ),
        /// Skip Text ///
        SkipText(
          onTap: (){
            pageController.animateToPage(
              2,
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeInOut,
            );
          },
        ),
      ],
    );
  }
}
