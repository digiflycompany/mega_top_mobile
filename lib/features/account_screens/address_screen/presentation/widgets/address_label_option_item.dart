import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';

class AddressLabelOptionItem extends StatelessWidget {
  const AddressLabelOptionItem(
      {super.key, required this.icon, required this.text});

  final String icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.otpBoxBorderColor),
      ),
      child: Row(
        children: [
          SvgPicture.asset(icon),
          Text(text),
        ],
      ),
    );
  }
}
