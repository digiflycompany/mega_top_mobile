import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/features/account_screens/address_screen/presentation/cubit/address_cubit.dart';
import 'package:mega_top_mobile/features/account_screens/address_screen/presentation/cubit/address_state.dart';

class AddressLabelOptionItem extends StatelessWidget {
  const AddressLabelOptionItem(
      {super.key, required this.icon, required this.text});

  final String icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddressCubit, AddressState>(
      listener: (BuildContext context, AddressState state) {},
      builder: (BuildContext context, AddressState state) {
        //final cubit = context.read<AddressCubit>();
        return GestureDetector(
          onTap: () {
            //cubit.changeSelectedAddressLabelOption(text);
          },
          child: Container(
            width: 100.w,
            height: 40.h,
            decoration: BoxDecoration(
                // color: cubit.selectedAddressLabelOption == text
                //     ? AppColors.otpBoxBorderColor
                //     : Colors.white,
                border: Border.all(color: AppColors.otpBoxBorderColor),
                borderRadius: BorderRadius.circular(4.r)),
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(icon),
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
