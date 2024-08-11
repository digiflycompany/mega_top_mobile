import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/app_fonts.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';

class CustomErrorToast extends StatefulWidget {
  final Color color;
  final String message;
  final String title;
  final VoidCallback onDismissed;

  const CustomErrorToast({
    Key? key,
    required this.message,
    required this.onDismissed, required this.color, required this.title,
  }) : super(key: key);

  @override
  State<CustomErrorToast> createState() => _CustomErrorToastState();
}

class _CustomErrorToastState extends State<CustomErrorToast>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacity;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
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
    return Opacity(
      opacity: _opacity.value,
      child: Container(
        width:double.infinity,
        height: context.height72,
        color: widget.color,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: context.width16,vertical: context.height6),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.title,
                style:  TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontFamily: FontFamilies.cairo,
                    fontWeight: FontWeight.w700,
                    decoration: TextDecoration.none
                ),
              ),
              FittedBox(
                child: Text(
                  widget.message,
                  style:  TextStyle(
                      color: Colors.white,
                      fontSize: 14.sp,
                      fontFamily: FontFamilies.cairo,
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.none
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
