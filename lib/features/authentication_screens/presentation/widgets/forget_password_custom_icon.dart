import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';

class ForgotPasswordIcon extends StatelessWidget {
  final String? icon;
  final Color? color;
  const ForgotPasswordIcon({super.key, this.icon, this.color});

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: context.width*0.176,
      height: context.height*0.087,
      decoration:  BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      child: Transform.scale(
          scale: 0.55,
          child: SvgPicture.asset(icon!,)),
    );
  }
}
