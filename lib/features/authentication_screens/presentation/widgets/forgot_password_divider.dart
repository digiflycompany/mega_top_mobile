import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../../core/utils/app_color.dart';

class ForgotPasswordDivider extends StatelessWidget {
  final Color? color;
  const ForgotPasswordDivider({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: Container(
        color: color,
        height: context.height*0.006,
      ),
    );
  }
}
