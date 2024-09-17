import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/widgets/custom_button.dart';
import 'package:mega_top_mobile/core/widgets/custom_cached_network_image.dart';
import 'package:mega_top_mobile/core/widgets/custom_image.dart';

class AdCard extends StatelessWidget {
  const AdCard({super.key, required this.title, required this.subtitle, required this.image});
  final String title, subtitle, image;

  @override
  Widget build(BuildContext context) {
    String currentLang = Localizations.localeOf(context).languageCode;
    double width = MediaQuery.of(context).size.width;
    return Stack(children: [
      CustomImage(
          imagePath: currentLang == 'en'
              ? AppAssets.adEnBackground
              : AppAssets.adArBackground,
          w: width * .85,
          fit: BoxFit.fill,
          h: 173),
      Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
            padding: EdgeInsets.only(
                top: 16,
                bottom: 16,
                left: currentLang == 'en' ? 24 : 9,
                right: currentLang == 'en' ? 9 : 24),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                  width: 143,
                  child: Text(title, style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold), overflow: TextOverflow.ellipsis, maxLines: 1)),
              Gap(12),
              SizedBox(
                width: 143,
                child: Text(subtitle,
                    style: TextStyle(color: Colors.white, fontSize: 14), maxLines: 2, overflow: TextOverflow.ellipsis),
              ),
              Gap(16),
              SizedBox(
                  child: CustomButton(
                      borderRadius: 100,
                      onPressed: () {},
                      text: 'Order now',
                      width: 71,
                      height: 24,
                      backgroundColor: Colors.white,
                      textStyle: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w700),
                      padding: EdgeInsets.zero,
                      margin: EdgeInsets.zero))
            ])),
        Gap(width < 600
            ? 20
            : width > 1000
                ? 500.w
                : 280.w),
        CustomCachedNetworkImage(url: image)
      ])
    ]);
  }
}
