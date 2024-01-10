import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mega_top_mobile/core/utils/media_query.dart';
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
        /// Skip Text ///
        SkipText(
          onTap: (){
            pageController.animateToPage(
              1,
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeInOut,
            );
          },
        ),
      ],
    );
  }
}
