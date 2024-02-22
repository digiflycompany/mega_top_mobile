import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/core/widgets/edit_text_form_field.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/primary_app_bar.dart';

class AddNewAddressDetailsScreen extends StatelessWidget {
  const AddNewAddressDetailsScreen({super.key});

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const EditTextField(
                title: "Location",
                text:
                    "Nasr City - Cairo Governorate - First District - 4450153",
              ),
              VerticalSpace(40.h),
              const EditTextField(
                title: "Additional address details",
                hintText: "More details about the address",
              ),
              VerticalSpace(40.h),
              const EditTextField(
                title: "First name",
                hintText: "Enter first name here",
              ),
              VerticalSpace(40.h),
              const EditTextField(
                title: "Last name",
                hintText: "Enter last name here",
              ),
              VerticalSpace(40.h),
              const EditTextField(
                title: "Mobile number",
                hintText: "Enter mobile number here",
              ),
              VerticalSpace(40.h),
              Text(
                "Address label (optional)",
                style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.greyTextColor),
              ),
              // SizedBox(
              //   width: context.width * 0.60,
              //   child: Row(
              //     children: [
              //       Expanded(
              //         child: AddressLabelOptionItem(
              //             icon: "home_outline_icon.svg", text: "Home"),
              //       ),
              //       HorizontalSpace(20.w),
              //       const Expanded(
              //         child: PrimaryOutlinedButton(
              //           text: "c",
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
