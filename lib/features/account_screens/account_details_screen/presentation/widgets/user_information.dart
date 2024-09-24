import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/services/shared_preferences/preferences_helper.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/features/account_screens/profile_screen/presentation/cubit/account_details_cubit.dart';
import 'package:mega_top_mobile/features/account_screens/profile_screen/presentation/cubit/account_details_state.dart';

class UserInformation extends StatelessWidget {
  const UserInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountDetailsCubit, AccountDetailsState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.only(top: 25.h, bottom: 40.h),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(PreferencesHelper.getUserModel?.data?.user?.fullName ?? '',
                      style: TextStyle(fontWeight: FontWeight.w700)),
                  Text(PreferencesHelper.getEmail().toString(),
                      style: TextStyle(color: AppColors.greyTextColor))
                ]
              )
            ]
          )
        );
      }
    );
  }
}
