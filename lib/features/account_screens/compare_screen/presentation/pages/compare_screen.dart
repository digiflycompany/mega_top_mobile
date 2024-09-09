import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/app_constants.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/core/widgets/custom_cached_network_image.dart';
import 'package:mega_top_mobile/features/account_screens/account_details_screen/presentation/cubit/compare_click_cubit.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/widgets/empty_response_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/primary_app_bar.dart';
import '../../../../../core/utils/global_cubit.dart';
import '../../../../../core/widgets/main_page_products_model.dart';

class CompareScreen extends StatelessWidget {
  final bool isEmpty;

  const CompareScreen({super.key, required this.isEmpty});

  @override
  Widget build(BuildContext context) {
    GlobalCubit globalCubit = context.read<GlobalCubit>();
    var cubit = context.read<CompareClickCubit>();
    List<Product> products = cubit.compareList;
    bool isFull = products.length == 2;
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size(double.infinity, context.height * 0.089),
            child: PrimaryAppBar(AppLocalizations.of(context)!.compareProducts,
                favour: false)),
        body: isEmpty
            ? Center(
              child: EmptyDataPage(
                  icon: AppAssets.emptyCompareIcon,
                  bigFontText: AppLocalizations.of(context)!.emptyList,
                  smallFontText: AppLocalizations.of(context)!
                      .yourComparisonListIsStillEmpty),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Container(
                                          height: 130.h,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(4.r),
                                              color: AppColors
                                                  .iconsBackgroundColor),
                                          child: Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                CustomCachedNetworkImage(
                                                    url: products[0].images![0],
                                                    width: 80.w,
                                                    height: 65.h),
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        top: 8.h, right: 8.w),
                                                    child: Align(
                                                        alignment:
                                                            Alignment.topRight,
                                                        child: InkWell(
                                                          onTap: () {
                                                            globalCubit
                                                                .removeFromCompareList(
                                                                    products[0]
                                                                        .id);
                                                            cubit
                                                                .goToComparison(true);
                                                            AppConstants
                                                                .showRemoveFromCompareToast(
                                                                    context);
                                                          },
                                                          child: Container(
                                                              width: 24.w,
                                                              height: 24.h,
                                                              decoration: BoxDecoration(
                                                                  color: Colors
                                                                      .white,
                                                                  shape: BoxShape
                                                                      .circle,
                                                                  border: Border.all(
                                                                      color: AppColors
                                                                          .primaryColor,
                                                                      width:
                                                                          1.5)),
                                                              child: Transform.scale(
                                                                  scale: 0.5,
                                                                  child: SvgPicture
                                                                      .asset(AppAssets
                                                                          .closeIconBlue))),
                                                        )))
                                              ])),
                                      VerticalSpace(14.h),
                                      Padding(
                                          padding:
                                              EdgeInsetsDirectional.symmetric(
                                                  horizontal: 8.w),
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(products[0].title,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize: 13.sp)),
                                              ]))
                                    ])),
                            isFull
                                ? Padding(
                                    padding: EdgeInsets.all(8.h),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          Container(
                                              height: 130.h,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          4.r),
                                                  color: AppColors
                                                      .iconsBackgroundColor),
                                              child: Stack(
                                                  alignment: Alignment.center,
                                                  children: [
                                                    CustomCachedNetworkImage(
                                                        url: products[1]
                                                            .images![0],
                                                        width: 80.w,
                                                        height: 65.h),
                                                    Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: 8.h,
                                                                right: 8.w),
                                                        child: Align(
                                                            alignment: Alignment
                                                                .topRight,
                                                            child: InkWell(
                                                              onTap: () {
                                                                globalCubit
                                                                    .removeFromCompareList(
                                                                        products[1]
                                                                            .id);
                                                                cubit
                                                                    .goToComparison(true);
                                                                AppConstants
                                                                    .showRemoveFromCompareToast(
                                                                        context);
                                                              },
                                                              child: Container(
                                                                  width: 24.w,
                                                                  height: 24.h,
                                                                  decoration: BoxDecoration(
                                                                      color: Colors
                                                                          .white,
                                                                      shape: BoxShape
                                                                          .circle,
                                                                      border: Border.all(
                                                                          color: AppColors
                                                                              .primaryColor,
                                                                          width:
                                                                              1.5)),
                                                                  child: Transform.scale(
                                                                      scale:
                                                                          0.5,
                                                                      child: SvgPicture.asset(
                                                                          AppAssets
                                                                              .closeIconBlue))),
                                                            )))
                                                  ])),
                                          VerticalSpace(14.h),
                                          Padding(
                                              padding: EdgeInsetsDirectional
                                                  .symmetric(horizontal: 8.w),
                                              child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                        products[1].title,
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            fontSize: 13.sp))
                                                  ]))
                                        ]))
                                : SizedBox()
                          ]),
                          TableRow(children: [
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 8.w, top: 15.h, bottom: 15.h),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        AppLocalizations.of(context)!.priceII,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.greyTextColor),
                                      ),
                                      VerticalSpace(5.h),
                                      Text(
                                          products[0]
                                                  .price
                                                  .finalPrice
                                                  .toString() +
                                              ' ' +
                                              AppLocalizations.of(context)!.le,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              color: AppColors.blackColor))
                                    ])),
                            isFull
                                ? Padding(
                                    padding: EdgeInsets.only(
                                        left: 8.w, top: 15.h, bottom: 15.h),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            AppLocalizations.of(context)!
                                                .priceII,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                color: AppColors.greyTextColor),
                                          ),
                                          VerticalSpace(5.h),
                                          Text(
                                              products[1]
                                                      .price
                                                      .finalPrice
                                                      .toString() +
                                                  ' ' +
                                                  AppLocalizations.of(context)!
                                                      .le,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  color: AppColors.blackColor))
                                        ]))
                                : SizedBox()
                          ]),
                          TableRow(children: [
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 8.w, top: 15.h, bottom: 15.h),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          AppLocalizations.of(context)!
                                              .category,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              color: AppColors.greyTextColor)),
                                      VerticalSpace(5.h),
                                      Text(products[0].categoryId.name,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              color: AppColors.blackColor))
                                    ])),
                            isFull
                                ? Padding(
                                    padding: EdgeInsets.only(
                                        left: 8.w, top: 15.h, bottom: 15.h),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                              AppLocalizations.of(context)!
                                                  .category,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  color:
                                                      AppColors.greyTextColor)),
                                          VerticalSpace(5.h),
                                          Text(products[1].categoryId.name,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  color: AppColors.blackColor))
                                        ]))
                                : SizedBox()
                          ]),
                          TableRow(children: [
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 8.w, top: 15.h, bottom: 15.h),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          AppLocalizations.of(context)!
                                              .availability,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              color: AppColors.greyTextColor)),
                                      VerticalSpace(5.h),
                                      Row(children: [
                                        SvgPicture.asset(
                                            AppAssets.checkIconGreen),
                                        HorizontalSpace(4.w),
                                        Text(
                                            products[0].active
                                                ? AppLocalizations.of(context)!
                                                    .available
                                                : AppLocalizations.of(context)!
                                                    .unAvailable,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                color: AppColors
                                                    .primaryGreenColor))
                                      ])
                                    ])),
                            isFull
                                ? Padding(
                                    padding: EdgeInsets.only(
                                        left: 8.w, top: 15.h, bottom: 15.h),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                              AppLocalizations.of(context)!
                                                  .availability,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  color:
                                                      AppColors.greyTextColor)),
                                          VerticalSpace(5.h),
                                          Row(children: [
                                            SvgPicture.asset(
                                                AppAssets.checkIconGreen),
                                            HorizontalSpace(4.w),
                                            Text(
                                                products[1].active
                                                    ? AppLocalizations.of(
                                                            context)!
                                                        .available
                                                    : AppLocalizations.of(
                                                            context)!
                                                        .unAvailable,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                    color: AppColors
                                                        .primaryGreenColor))
                                          ])
                                        ]))
                                : SizedBox()
                          ]),
                          TableRow(children: [
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 8.w, top: 15.h, bottom: 15.h),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          AppLocalizations.of(context)!
                                              .description,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              color: AppColors.greyTextColor)),
                                      VerticalSpace(5.h),
                                      Text(products[0].description,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              color: AppColors.blackColor))
                                    ])),
                            isFull
                                ? Padding(
                                    padding: EdgeInsets.only(
                                        left: 8.w, top: 15.h, bottom: 15.h),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                              AppLocalizations.of(context)!
                                                  .description,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  color:
                                                      AppColors.greyTextColor)),
                                          VerticalSpace(5.h),
                                          Text(products[1].description,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  color: AppColors.blackColor))
                                        ]))
                                : SizedBox()
                          ])
                        ]))));
  }
}