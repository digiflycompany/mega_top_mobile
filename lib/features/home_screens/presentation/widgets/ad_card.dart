import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/app_routes.dart';
import 'package:mega_top_mobile/core/widgets/custom_button.dart';
import 'package:mega_top_mobile/core/widgets/custom_cached_network_image.dart';
import 'package:mega_top_mobile/core/widgets/custom_image.dart';
import 'package:mega_top_mobile/features/home_screens/cubit/latest_products_cubit.dart';
import 'package:mega_top_mobile/features/home_screens/data/models/advertisement_model.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/pages/ad_details_screen.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/main_page_product_details_screen.dart';

class AdCard extends StatelessWidget {
  const AdCard({super.key, required this.ad});
  final Advertisement ad;

  @override
  Widget build(BuildContext context) {
    String currentLang = Localizations.localeOf(context).languageCode;
    double width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => AdDetailsScreen(id: ad.productId!.id!))),
      child: Stack(children: [
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
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                        width: 143,
                        child: Text(ad.title!,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1)),
                    Gap(12),
                    SizedBox(
                      width: 143,
                      child: Text(ad.subtitle!,
                          style: TextStyle(color: Colors.white, fontSize: 14),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis),
                    ),
                    Gap(16),
                    SizedBox(
                        child: CustomButton(
                            borderRadius: 100,
                            onPressed: () => Navigator.push(
                                context, MaterialPageRoute(builder: (context) => AdDetailsScreen(id: ad.productId!.id!))),
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
          CustomCachedNetworkImage(url: ad.image!)
        ])
      ]),
    );
  }
}
