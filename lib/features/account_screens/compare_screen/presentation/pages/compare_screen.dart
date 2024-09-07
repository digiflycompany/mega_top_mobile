import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/widgets/empty_response_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/primary_app_bar.dart';

class CompareScreen extends StatelessWidget {
  final bool isEmpty = false;

  const CompareScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size(double.infinity, context.height * 0.089),
            child: PrimaryAppBar(
              AppLocalizations.of(context)!.compareProducts,
              favour: false,
            )),
        body: isEmpty
            ? const EmptyDataPage(
                icon: AppAssets.emptyCompareIcon,
                // bigFontText: AppStrings.noProductAddedToCompareEn,
                // smallFontText: AppStrings.emptyComparePageDescriptionEn,
                // buttonText: AppStrings.continueShoppingEn,
              )
            : SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: context.width * 0.045,
                      vertical: context.height24),
                  child: Table(
                      border: TableBorder.all(
                          color: AppColors.smallContainerGreyColor),
                      children: [
                        TableRow(children: [
                          Padding(
                            padding: EdgeInsets.all(8.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Container(
                                  height: 130.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4.r),
                                    color: AppColors.iconsBackgroundColor,
                                  ),
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Image.asset(
                                        AppAssets.upsSearchResult,
                                        width: 80.w,
                                        height: 65.h,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: 8.h, right: 8.w),
                                        child: Align(
                                            alignment: Alignment.topRight,
                                            child: Container(
                                              width: 24.w,
                                              height: 24.h,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                    color:
                                                        AppColors.primaryColor,
                                                    width: 1.5),
                                              ),
                                              child: Transform.scale(
                                                scale: 0.5,
                                                child: SvgPicture.asset(
                                                  AppAssets.closeIconBlue,
                                                ),
                                              ),
                                            )),
                                      )
                                    ],
                                  ),
                                ),
                                VerticalSpace(14.h),
                                Padding(
                                  padding: EdgeInsetsDirectional.symmetric(
                                      horizontal: 8.w),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'UPS - Version 1',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 13.sp),
                                      ),
                                      VerticalSpace(6.h),
                                      Text(
                                        "UPS",
                                        style: TextStyle(
                                            color: AppColors.greyTextColor,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 13.sp),
                                      ),
                                      VerticalSpace(10.h),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "1500 LE",
                                            style: TextStyle(
                                              color: AppColors.primaryColor,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          SvgPicture.asset(
                                            AppAssets.favourOutlinedIcon,
                                            width: 20.w,
                                            height: 20.h,
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Container(
                                  height: 130.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4.r),
                                    color: AppColors.iconsBackgroundColor,
                                  ),
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Image.asset(
                                        AppAssets.hardDiskImage,
                                        width: 80.w,
                                        height: 65.h,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: 8.h, right: 8.w),
                                        child: Align(
                                            alignment: Alignment.topRight,
                                            child: Container(
                                              width: 24.w,
                                              height: 24.h,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                    color:
                                                        AppColors.primaryColor,
                                                    width: 1.5),
                                              ),
                                              child: Transform.scale(
                                                scale: 0.5,
                                                child: SvgPicture.asset(
                                                  AppAssets.closeIconBlue,
                                                ),
                                              ),
                                            )),
                                      )
                                    ],
                                  ),
                                ),
                                VerticalSpace(14.h),
                                Padding(
                                  padding: EdgeInsetsDirectional.symmetric(
                                      horizontal: 8.w),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'UPS - Version 1',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 13.sp),
                                      ),
                                      VerticalSpace(6.h),
                                      Text(
                                        "UPS",
                                        style: TextStyle(
                                            color: AppColors.greyTextColor,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 13.sp),
                                      ),
                                      VerticalSpace(10.h),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "1500 LE",
                                            style: TextStyle(
                                              color: AppColors.primaryColor,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          SvgPicture.asset(
                                            AppAssets.favourOutlinedIcon,
                                            width: 20.w,
                                            height: 20.h,
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ]),
                        TableRow(children: [
                          Padding(
                            padding: EdgeInsets.only(
                                left: 8.w, top: 15.h, bottom: 15.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Price',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.greyTextColor),
                                ),
                                VerticalSpace(5.h),
                                Text(
                                  '1500 LE',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.blackColor),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 8.w, top: 15.h, bottom: 15.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Price',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.greyTextColor),
                                ),
                                VerticalSpace(5.h),
                                Text(
                                  '1500 LE',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.blackColor),
                                ),
                              ],
                            ),
                          ),
                        ]),
                        TableRow(children: [
                          Padding(
                            padding: EdgeInsets.only(
                                left: 8.w, top: 15.h, bottom: 15.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Category',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.greyTextColor),
                                ),
                                VerticalSpace(5.h),
                                Text(
                                  'UPS',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.blackColor),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 8.w, top: 15.h, bottom: 15.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Category',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.greyTextColor),
                                ),
                                VerticalSpace(5.h),
                                Text(
                                  'Storage units',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.blackColor),
                                ),
                              ],
                            ),
                          ),
                        ]),
                        TableRow(children: [
                          Padding(
                            padding: EdgeInsets.only(
                                left: 8.w, top: 15.h, bottom: 15.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Brand',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.greyTextColor),
                                ),
                                VerticalSpace(5.h),
                                Text(
                                  'Dell',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.blackColor),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 8.w, top: 15.h, bottom: 15.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Brand',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.greyTextColor),
                                ),
                                VerticalSpace(5.h),
                                Text(
                                  'Dell',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.blackColor),
                                ),
                              ],
                            ),
                          ),
                        ]),
                        TableRow(children: [
                          Padding(
                            padding: EdgeInsets.only(
                                left: 8.w, top: 15.h, bottom: 15.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Availability',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.greyTextColor),
                                ),
                                VerticalSpace(5.h),
                                Row(
                                  children: [
                                    SvgPicture.asset(AppAssets.checkIconGreen),
                                    HorizontalSpace(4.w),
                                    Text(
                                      'Available',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          color: AppColors.primaryGreenColor),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 8.w, top: 15.h, bottom: 15.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Availability',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.greyTextColor),
                                ),
                                VerticalSpace(5.h),
                                Row(
                                  children: [
                                    SvgPicture.asset(AppAssets.closeIconRed),
                                    HorizontalSpace(4.w),
                                    Text(
                                      'Unavailable ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          color: AppColors.red),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ]),
                        TableRow(children: [
                          Padding(
                            padding: EdgeInsets.only(
                                left: 8.w, top: 15.h, bottom: 15.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Description',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.greyTextColor),
                                ),
                                VerticalSpace(5.h),
                                Text(
                                  'A unit that supplies electrical energy and converts it to the computer. Not only that, but it also converts the electrical charge outside the computer into a permanent and continuous current inside it, and it also performs a regulatory process for the device in order to protect it from burning.',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.blackColor),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 8.w, top: 15.h, bottom: 15.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Description',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.greyTextColor),
                                ),
                                VerticalSpace(5.h),
                                Text(
                                  'A unit that supplies electrical energy and converts it to the computer. Not only that, but it also converts the electrical charge outside the computer into a permanent and continuous current inside it, and it also performs a regulatory process for the device in order to protect it from burning.',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.blackColor),
                                ),
                              ],
                            ),
                          ),
                        ]),
                      ]),
                ),
              ));
  }
}
