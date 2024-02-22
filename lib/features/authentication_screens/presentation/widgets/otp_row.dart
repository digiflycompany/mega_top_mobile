import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';

import 'otp_box.dart';

class OtpRow extends StatelessWidget {
  const OtpRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.width * 0.11),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          OtpBox(
            number: AppStrings.four,
          ),
          OtpBox(
            number: AppStrings.five,
          ),
          OtpBox(
            number: AppStrings.six,
          ),
          OtpBox(
            number: AppStrings.seven,
          ),
        ],
      ),
    );
  }
}
