import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import '../utils/app_color.dart';

class PrimaryArrowButton extends StatelessWidget {
  final Function()? onTap;
  final String? text;
  const PrimaryArrowButton({super.key, this.onTap, this.text});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: context.width*0.045),
        child: Container(
          width: double.infinity,
          height: context.height*0.069,
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(4),
          ),
          child:  Stack(
            children: [
              Center(
                child: Text(
                  text!,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 17
                  ),
                ),
              ),
              Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: Padding(
                    padding:  EdgeInsets.only(right: context.width*0.066),
                    //padding:  EdgeInsets.only(right: 24),
                    child: SvgPicture.asset(AppAssets.arrowButton),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
