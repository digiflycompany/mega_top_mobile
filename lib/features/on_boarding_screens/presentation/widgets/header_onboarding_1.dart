import 'package:flutter/cupertino.dart';
import 'package:mega_top_mobile/core/utils/media_query.dart';
import '../../../../core/utils/app_assets.dart';
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
          padding:  EdgeInsets.only(top: context.height*0.125),
          child: Transform.scale(
              scale: 0.96,
              child: Image.asset(AppAssets.searchPurpleIcon,)),
        ),
        /// Camera Image ///
        Padding(
          padding:  EdgeInsets.only(top: context.height*0.23,right: context.width*0.6),
          child: Transform.scale(
              scale: 0.4,
              child: Image.asset(AppAssets.cameraIcon)),
        ),
        /// HardDisk Image ///
        Padding(
          padding:  EdgeInsets.only(top: context.height*0.19,left: context.width*0.52),
          child: Transform.scale(
              scale: 0.3,
              child: Image.asset(AppAssets.hardDiskIcon)),
        ),
        /// CPU Image ///
        Padding(
          padding:  EdgeInsets.only(top: context.height*0.065,right: context.width*0.52),
          child: Transform.scale(
              scale: 0.37,
              child: Image.asset(AppAssets.cpuIcon)),
        ),
        /// Skip Text ///

      ],
    );
  }
}
