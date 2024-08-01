import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/app_routes.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/features/account_screens/account_details_screen/presentation/widgets/account_option_item.dart';
import 'package:mega_top_mobile/features/account_screens/profile_screen/data/repositories/account_details_repo.dart';
import 'package:mega_top_mobile/features/account_screens/profile_screen/presentation/cubit/account_details_cubit.dart';
import 'package:mega_top_mobile/features/account_screens/profile_screen/presentation/cubit/account_details_state.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/verify_email_widgets/small_circular_progress_indicator.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem(
      {super.key, this.mainIcon, this.title, this.optionalData, this.onTap});

  final String? mainIcon;
  final String? title;
  final Widget? optionalData;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AccountDetailsCubit(AccountDetailsRepoImp())..getAccountDetails(),
      child: Builder(
        builder: (context) {
          final cubit = context.read<AccountDetailsCubit>();
          return BlocBuilder<AccountDetailsCubit, AccountDetailsState>(
            builder: (context, state) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 16.h),
                child: AccountOptionItem(
                  mainIcon: mainIcon ?? AppAssets.notificationIcon,
                  title: title ?? AppStrings.notifications,
                  onTap: () {
                    Navigator.pushNamed(context, Routes.notificationPageRoute).then((_) {
                      cubit.getAccountDetails();
                    });
                  },
                  optionalData: optionalData ??
                      Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.iconsBackgroundColor,
                        ),
                        width: 24.h,
                        height: 24.h,
                        child: Center(
                          child: state is AccountDetailsNoInternetConnection
                              ? Transform.scale(
                              scale: 0.65,
                              child: SvgPicture.asset(AppAssets.noInternetIcon))
                              : state is AccountDetailsLoading
                              ? SmallCircularProgressIndicator()
                              : Text(
                            cubit.unreadNotificationCount.toString(),
                            style: TextStyle(
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                ),
              );
            },
          );
        }
      ),
    );
  }
}
