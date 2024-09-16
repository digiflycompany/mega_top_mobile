import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/widgets/custom_button.dart';
import 'package:mega_top_mobile/core/widgets/custom_image.dart';

class AdCard extends StatelessWidget {
  const AdCard({super.key});

  @override
  Widget build(BuildContext context) {
    String currentLang = Localizations.localeOf(context).languageCode;
    double width = MediaQuery.of(context).size.width;
    return Stack(children: [
      CustomImage(
          imagePath: currentLang == 'en'
              ? AppAssets.adEnBackground
              : AppAssets.adArBackground, w: width * .85, fit: BoxFit.fill, h: 173),
      Row(
          crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
            padding: EdgeInsets.only(
                top: 16,
                bottom: 16,
                left: currentLang == 'en' ? 24 : 9,
                right: currentLang == 'en' ? 9 : 24),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              CustomImage(imagePath: AppAssets.brandLogo, w: 120, h: 16.06),
              Gap(12),
              Text('50% offer',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w700)),
              Gap(10.3),
              Text('on surveillance cameras',
                  style: TextStyle(color: Colors.white, fontSize: 14)),
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
                    margin: EdgeInsets.zero),
              )            ])),
        Gap(width < 600 ? 0: width > 1000? 500.w: 280.w),
        CustomImage(imagePath: AppAssets.adImage, h: 124, w: 126)
      ])
    ]);
  }
}