import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/core/widgets/button_bottom_nav_bar.dart';
import 'package:mega_top_mobile/core/widgets/primary_button.dart';
import 'package:mega_top_mobile/features/account_screens/address_screen/data/repositories/address_repo.dart';
import 'package:mega_top_mobile/features/account_screens/address_screen/presentation/cubit/address_cubit.dart';
import 'package:mega_top_mobile/features/account_screens/address_screen/presentation/cubit/address_state.dart';
import 'package:mega_top_mobile/features/account_screens/address_screen/presentation/widgets/address_label_option_item.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/primary_app_bar.dart';

class EditAddressDetailsScreen extends StatelessWidget {
  const EditAddressDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(double.infinity, context.height * 0.089),
          child: const PrimaryAppBar(
            AppStrings.addNewAddress,
            favour: false,
          )),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.width * 0.045,
          vertical: context.height * 0.033,
        ),
        child: SingleChildScrollView(
          child: BlocProvider<AddressCubit>(
            create: (BuildContext context) => AddressCubit(AddressRepoImp()),
            child: BlocConsumer<AddressCubit, AddressState>(
              listener: (BuildContext context, AddressState state) {},
              builder: (BuildContext context, AddressState state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // const EditTextField(
                    //   title: "Location",
                    //   text:
                    //       "Nasr City - Cairo Governorate - First District - 4450153",
                    // ),
                    // VerticalSpace(40.h),
                    // const EditTextField(
                    //   title: "Additional address details",
                    //   text: "First Abbas",
                    // ),
                    // VerticalSpace(40.h),
                    // const EditTextField(
                    //   title: "First name",
                    //   text: "Mohamed",
                    // ),
                    // VerticalSpace(40.h),
                    // const EditTextField(
                    //   title: "Last name",
                    //   text: "Nashaat",
                    // ),
                    // VerticalSpace(40.h),
                    // const EditTextField(
                    //   title: "Mobile number",
                    //   text: "01020889544",
                    // ),
                    VerticalSpace(40.h),
                    Text(
                      "Address label (optional)",
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.greyTextColor),
                    ),
                    VerticalSpace(24.h),
                    SizedBox(
                      width: 215.w,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AddressLabelOptionItem(
                            icon: AppAssets.homeOutlineIcon,
                            text: AppStrings.homeEn,
                          ),
                          AddressLabelOptionItem(
                            icon: AppAssets.workOutlineIcon,
                            text: AppStrings.work,
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
      bottomNavigationBar: ButtonBottomNavBar(
          button: PrimaryButton(
            content: Text(
              AppStrings.editAddress,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 16.sp,
              ),
            ),
      )),
    );
  }
}
