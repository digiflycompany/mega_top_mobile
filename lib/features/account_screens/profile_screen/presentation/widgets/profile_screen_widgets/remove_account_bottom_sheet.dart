import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/features/account_screens/profile_screen/presentation/widgets/profile_screen_widgets/remove_account_bottom_sheet_body.dart';
import 'package:mega_top_mobile/features/categories_screens/presentation/widgets/bottom_sheet_app_bar.dart';

class RemoveAccountBottomSheet extends StatelessWidget {
  const RemoveAccountBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 290.h,
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.only(bottom: 0,),
          child: Column(
            children: [
              const BottomSheetAppBar(AppStrings.removeAccountCapitalA),
              RemoveAccountBottomSheetBody(),
            ],
          ),
        ));
  }
}
