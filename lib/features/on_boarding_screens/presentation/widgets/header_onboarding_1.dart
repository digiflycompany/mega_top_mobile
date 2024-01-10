import 'package:flutter/cupertino.dart';
import 'package:mega_top_mobile/core/utils/media_query.dart';
import '../../../../core/utils/app-assets.dart';
import 'custom_curved_container.dart';

class FirstHeader extends StatelessWidget {
  const FirstHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        /// BackGroundImage ///
        CustomPaint(
          size: Size(double.infinity, context.height*0.44),
          painter: ArcPainter(),
        ),
        /// Purple Search Icon ///
        Padding(
          padding:  EdgeInsets.only(top: context.height*0.13),
          child: Transform.scale(
              scale: 0.95,
              child: Image.asset(AppAssets.searchPurpleIcon,)),
        ),
      ],
    );
  }
}
