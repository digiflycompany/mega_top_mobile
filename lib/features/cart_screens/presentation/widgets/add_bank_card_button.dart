import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';

import '../../../../core/utils/app_string.dart';
import '../../../../core/widgets/primary_button.dart';

class AddBankCardButton extends StatelessWidget {
  const AddBankCardButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: context.width * 0.045),
          child: PrimaryButton(
            content: Text(
              AppStrings.addBankCardEn,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 16.sp,
              ),
            ),
            onTap: () => Navigator.pop(context),
          ),
        ),
      ),
    );
  }
}
