import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.icon, // Add icon property
    this.backgroundColor,
    this.width,
    this.textColor,
    this.borderColor,
    this.borderRadius,
    this.padding,
    this.fontSize,
    this.fontWeight,
    this.margin,
    this.textStyle, this.height,
  });

  final VoidCallback onPressed;
  final String text;
  final Widget? icon; // Define icon property
  final Color? backgroundColor;
  final double? width;
  final double? height;
  final Color? textColor;
  final Color? borderColor;
  final double? borderRadius;
  final EdgeInsetsGeometry? padding;
  final double? fontSize;
  final FontWeight? fontWeight;
  final EdgeInsetsGeometry? margin;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: backgroundColor ?? AppColors.primaryColor,
          borderRadius: BorderRadius.circular(borderRadius ?? 8),
          border:
              borderColor != null ? Border.all(color: borderColor!) : null
        ),
        padding: EdgeInsets.zero,
        margin: margin ?? const EdgeInsets.symmetric(horizontal: 16),
        height: height,
        width: width ??
            (kIsWeb
                ? MediaQuery.of(context).size.width / 3
                : double.infinity),
        child: MaterialButton(
            padding:
                kIsWeb ? const EdgeInsets.symmetric(vertical: 20) : padding,
            onPressed: onPressed,
            child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (icon != null) icon!,
                  SizedBox(width: icon != null ? 8.0 : 0),
                  Text(text,
                      style: textStyle ??
                          TextStyle(
                              fontSize: fontSize ?? 16,
                              color: textColor ?? Colors.white,
                              fontWeight: fontWeight ?? FontWeight.w700))
                ])));
  }
}