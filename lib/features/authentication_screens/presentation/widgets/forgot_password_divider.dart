import 'package:flutter/cupertino.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';

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
