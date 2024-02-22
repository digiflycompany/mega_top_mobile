import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/core/widgets/button_bottom_nav_bar.dart';
import 'package:mega_top_mobile/core/widgets/edit_text_form_field.dart';
import 'package:mega_top_mobile/core/widgets/primary_button.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/primary_app_bar.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(double.infinity, context.height * 0.089),
          child: const PrimaryAppBar(
            AppStrings.profileDetails,
            favour: false,
          )),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.width * 0.066),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VerticalSpace(50.h),
              Align(
                alignment: Alignment.center,
                child: Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.bottomRight,
                  children: [
                    Container(
                      decoration: const BoxDecoration(shape: BoxShape.circle),
                      height: 80.h,
                      width: 80.h,
                      child: ClipOval(
                        child: Image.asset(
                          AppAssets.customerProfilePhoto,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      right: -5.w,
                      child: Container(
                        width: 32.w,
                        height: 32.w,
                        decoration: const BoxDecoration(
                          color: AppColors.cameraBackground,
                          shape: BoxShape.circle,
                        ),
                        child: Transform.scale(
                          scale: 0.5,
                          child: SvgPicture.asset(
                            AppAssets.updatePhotoIcon,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              VerticalSpace(40.h),
              const EditTextField(
                title: AppStrings.emailEn,
                text: "mohamed.nashaat7733@gmail.com",
              ),
              VerticalSpace(40.h),
              EditTextField(
                title: AppStrings.firstName,
                text: "Abanoub",
                suffix: Transform.scale(
                  scale: 0.5,
                  child: SvgPicture.asset(
                    AppAssets.editIcon,
                  ),
                ),
              ),
              VerticalSpace(40.h),
              EditTextField(
                title: AppStrings.lastName,
                text: "Gamil",
                suffix: Transform.scale(
                  scale: 0.5,
                  child: SvgPicture.asset(
                    AppAssets.editIcon,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: ButtonBottomNavBar(
          button: PrimaryButton(
        text: AppStrings.save,
        onTap: () {
          Navigator.pop(context);
        },
      )),
    );
  }
}
