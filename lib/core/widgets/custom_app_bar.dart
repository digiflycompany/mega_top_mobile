import 'package:flutter/material.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/widgets/title_app_bar.dart';
import '../utils/app_color.dart';
import 'app_bar_back_icon.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar(this.text, {super.key});
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
        title: Padding(
          padding: EdgeInsets.only(top: context.height * 0.008),
          child: TitleText(text: text),
        ),
        centerTitle: true,
        leading: AppBarBackArrow(
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
