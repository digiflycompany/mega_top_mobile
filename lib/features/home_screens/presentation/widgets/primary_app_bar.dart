import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/core/widgets/title_app_bar.dart';
import '../../../../core/utils/app_color.dart';
import '../../../../core/widgets/app_bar_back_icon.dart';
class PrimaryAppBar extends StatelessWidget {
  const PrimaryAppBar(  this.text, {super.key});
  final String text;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: context.height*0.087,
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: AppColors.shadowAppBarColor,
              offset: Offset(0.0, 4.0), // Offset to control the shadow position
              blurRadius: 4.0, // Spread of the shadow
            ),
          ],
        ),
        child: Row(
          children: [
            AppBarBackArrow(
              onTap: (){
                Navigator.pop(context);
              },
            ),
            HorizontalSpace(context.width*0.022),
            TitleText(text: text),
          ],
        ),
      ),
    );
  }
}
