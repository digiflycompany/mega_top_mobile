import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/features/account_screens/address_screen/cubit/add_address_details_cubit.dart';
import 'package:mega_top_mobile/features/account_screens/address_screen/cubit/add_address_details_state.dart';

class AddressLabelOptionItem extends StatelessWidget {
  const AddressLabelOptionItem(
      {super.key, required this.icon, required this.text});

  final String icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddAddressDetailsCubit, AddAddressDetailsState>(
      listener: (BuildContext context, AddAddressDetailsState state) {},
      builder: (BuildContext context, AddAddressDetailsState state) {
        final cubit = AddAddressDetailsCubit.get(context);
        return GestureDetector(
          onTap: () {
            cubit.changeSelectedAddressLabelOption(text);
          },
          child: Container(
            width: 100.w,
            height: 40.h,
            decoration: BoxDecoration(
                color: cubit.selectedAddressLabelOption == text
                    ? AppColors.otpBoxBorderColor
                    : Colors.white,
                border: Border.all(color: AppColors.otpBoxBorderColor),
                borderRadius: BorderRadius.circular(4.r)),
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              children: [
                SvgPicture.asset(icon),
                HorizontalSpace(7.w),
                Text(text,
                    style: const TextStyle(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w700)),
              ],
            ),
          ),
        );
      },
    );
  }
}
