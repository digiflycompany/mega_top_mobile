import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/widgets/custom_button.dart';
import 'package:mega_top_mobile/core/widgets/custom_cached_network_image.dart';
import 'package:mega_top_mobile/core/widgets/custom_image.dart';
import 'package:mega_top_mobile/features/home_screens/cubit/home_cubit.dart';
import 'package:mega_top_mobile/features/home_screens/cubit/home_states.dart';
import 'package:mega_top_mobile/features/home_screens/data/models/advertisement_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AdCard extends StatelessWidget {
  const AdCard({super.key, required this.ad});
  final Advertisement ad;

  @override
  Widget build(BuildContext context) {
    String currentLang = Localizations.localeOf(context).languageCode;
    double width = MediaQuery.of(context).size.width;
    return BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
      var cubit = HomeCubit().getCubit(context);
      return InkWell(
          onTap: () => cubit.onAddPressed(context, ad),
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
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis)),
                        Spacer(),
                        GestureDetector(
                          onTap: () => cubit.onAddPressed(context, ad),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(100.r)
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                              child: Center(
                                child: Text(
                                  AppLocalizations.of(context)!.orderNow,
                                  style: TextStyle(
                                      color: AppColors.primaryColor,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            ),
                          ),
                        )
                        // SizedBox(
                        //     child: CustomButton(
                        //         borderRadius: 100.r,
                        //         onPressed: () =>
                        //             cubit.onAddPressed(context, ad),
                        //         text: AppLocalizations.of(context)!.orderNow,
                        //         // width: 71.w,
                        //         // height: 24.h,
                        //         backgroundColor: Colors.white,
                        //         textStyle: TextStyle(
                        //             color: AppColors.primaryColor,
                        //             fontSize: 12.sp,
                        //             fontWeight: FontWeight.w700),
                        //         padding: EdgeInsets.zero,
                        //         margin: EdgeInsets.zero))
                      ])),
              Spacer(),
              Padding(
                padding: EdgeInsetsDirectional.only(end: 16),
                child: Center(child: CustomCachedNetworkImage(url: ad.image!,fit: BoxFit.contain,)),
              )
            ])
          ]));
    });
  }
}