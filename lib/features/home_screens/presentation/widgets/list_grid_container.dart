import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/spacer.dart';

class ListGridContainer extends StatelessWidget {
  final String? image;
  final String? text;
  const ListGridContainer({super.key, this.image, this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: Container(
        height:context.height*0.055,
        width: context.width*0.22,
        decoration:  BoxDecoration(
            color: AppColors.circleAvatarBackground,
            borderRadius: BorderRadius.circular(context.height*0.006 )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(image!),
            HorizontalSpace(context.width*0.022 ),
            Text(
              text!,
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 15.5
              ),
            ),
          ],
        ),
      ),
    );
  }
}
