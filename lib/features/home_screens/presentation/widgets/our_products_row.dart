import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/features/home_screens/cubit/home_cubit.dart';
import 'package:mega_top_mobile/features/home_screens/cubit/home_states.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/app_string.dart';
import '../../../../core/utils/spacer.dart';

class ViewAllRow extends StatelessWidget {
  final String? bigText;
  const ViewAllRow({super.key, this.bigText});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (BuildContext context, HomeState state) {  },
      builder: (BuildContext context, HomeState state) {
        final homeCubit = context.read<HomeCubit>();
        return Row(
          children: [
            Text(
              bigText!,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 18.sp),
            ),
            const Spacer(),
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: (){
                homeCubit.onBottomNavItemChanged(1);
              },
              child: Row(
                children: [
                  Text(
                    AppStrings.viewAllEn,
                    style: TextStyle(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 14.sp),
                  ),
                  HorizontalSpace(context.width * 0.022),
                  SvgPicture.asset(AppAssets.primaryArrow),
                ],
              ),
            ),

          ],
        );
      },
    );
  }
}
