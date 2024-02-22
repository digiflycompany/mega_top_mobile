import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/app_routes.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/core/widgets/button_bottom_nav_bar.dart';
import 'package:mega_top_mobile/core/widgets/primary_button.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/primary_app_bar.dart';

class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(double.infinity, context.height * 0.089),
          child: const PrimaryAppBar(
            AppStrings.addNewAddress,
            favour: false,
          )),
      body: Stack(
        children: [
          const GoogleMap(
              initialCameraPosition: CameraPosition(
                  target: LatLng(30.016894, 31.377034), zoom: 10)),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: context.width * 0.045,
              vertical: context.height * 0.033,
            ),
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                horizontal: context.width * 0.045,
                vertical: context.height * 0.033,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4.r),
                boxShadow: const [
                  BoxShadow(
                    color: AppColors.containerShadow,
                    offset: Offset(0, 2),
                    blurRadius: 25,
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    AppAssets.locationOutlinedIcon,
                    width: 20.w,
                    height: 20.w,
                  ),
                  HorizontalSpace(8.w),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Nasr City - Cairo Governorate - First District - 4450153",
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w700,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        VerticalSpace(5.h),
                        Text(
                          "Nasr city",
                          style: TextStyle(
                            color: AppColors.greyTextColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 12.sp,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: ButtonBottomNavBar(
        button: PrimaryButton(
          text: "Confirm Location",
          onTap: () {
            Routes.addNewAddressDetailsPageRoute.moveTo;
          },
        ),
      ),
    );
  }
}
