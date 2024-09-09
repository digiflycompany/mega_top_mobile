import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  const CustomImage({super.key, required this.imagePath, this.h, this.w, this.fit});

  final String imagePath;
  final double? h, w;
  final BoxFit? fit;
  @override
  Widget build(BuildContext context) {
    return Image.asset(imagePath, width: w, height: h, fit: fit);
  }
}