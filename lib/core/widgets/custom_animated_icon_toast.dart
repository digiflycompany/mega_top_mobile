import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mega_top_mobile/core/utils/app_fonts.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';

class AnimatedOverlayIconToast extends StatefulWidget {
  final String toastIcon;
  final Color color;
  final String message;
  final VoidCallback onDismissed;

  const AnimatedOverlayIconToast({
    Key? key,
    required this.message,
    required this.onDismissed, required this.color, required this.toastIcon,
  }) : super(key: key);

  @override
  State<AnimatedOverlayIconToast> createState() => _AnimatedOverlayToastState();
}

class _AnimatedOverlayToastState extends State<AnimatedOverlayIconToast>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacity;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
    );
    _opacity = Tween<double>(begin: 0.0, end: 1.0).animate(_controller)
      ..addListener(() {
        setState(() {});
      });

    _controller.forward().then((value) {
      Future.delayed(const Duration(seconds: 1), () {
        _controller.reverse().then((value) {
          widget.onDismissed();
        });
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isRtl = Directionality.of(context) == TextDirection.rtl;

    return Opacity(
      opacity: _opacity.value,
      child: Container(
        alignment: Alignment.center,
        height: context.height * 0.087,
        color: widget.color,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          textDirection: isRtl ? TextDirection.rtl : TextDirection.ltr,
          children: isRtl
              ? [
            Text(
              widget.message,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14.sp,
                fontFamily: FontFamilies.cairo,
                fontWeight: FontWeight.w700,
                decoration: TextDecoration.none,
              ),
            ),
            HorizontalSpace(context.width * 0.022),
            SvgPicture.asset(widget.toastIcon),
          ]
              : [
            SvgPicture.asset(widget.toastIcon),
            HorizontalSpace(context.width * 0.022),
            Text(
              widget.message,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14.sp,
                fontFamily: FontFamilies.cairo,
                fontWeight: FontWeight.w700,
                decoration: TextDecoration.none,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
