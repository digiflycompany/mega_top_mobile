import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/core/widgets/custom_app_bar.dart';
import '../../../../core/utils/app_string.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: Size(double.infinity, context.height*0.087),
          child: const CustomAppBar(AppStrings.resetPasswordEn)),
      body: Column(
        children: [
          VerticalSpace(context.height*0.055),
          Row(
            children: [
              Container(

              )
            ],
          )
        ],
      ),
    );
  }
}
