import 'package:flutter/material.dart';
import 'package:mega_top_mobile/core/widgets/title_app_bar.dart';
import '../../../../core/utils/app_color.dart';
import '../../../../core/widgets/app_bar_back_icon.dart';
class MainAppBar extends StatelessWidget {
  const MainAppBar(  this.text, {super.key});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowAppBarColor,
            offset: Offset(0.0, 4.0), // Offset to control the shadow position
            blurRadius: 4.0, // Spread of the shadow
          ),
        ],
      ),
      child: AppBar(
        backgroundColor: Colors.white,
        title: TitleText(text: text),
        centerTitle: false,
        leading: AppBarBackArrow(
          onTap: (){
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
