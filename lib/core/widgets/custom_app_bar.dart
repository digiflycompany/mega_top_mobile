import 'package:flutter/material.dart';
import 'package:mega_top_mobile/core/widgets/primary_arrow_button.dart';
import 'package:mega_top_mobile/core/widgets/title_app_bar.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar(  this.text, {super.key});
  final String text;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      elevation: 0,
      title: TitleText(text: text),
      centerTitle: true,
      actions: const [
        PrimaryArrowButton()
      ],
    );
  }
}
