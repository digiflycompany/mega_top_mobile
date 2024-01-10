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
        CustomPaint(
          size: Size(double.infinity, context.height*0.43),
          painter: ArcPainter(),
        ),
        Transform.scale(
            scale: 0.85,
            child: Image.asset(AppAssets.searchPurpleIcon,)),
      ],
    );
  }
}
