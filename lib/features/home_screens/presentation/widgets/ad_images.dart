import 'package:flutter/material.dart';
import 'package:mega_top_mobile/core/widgets/custom_cached_network_image.dart';

class AdImages extends StatelessWidget {
  const AdImages({super.key, this.image});
  final String? image;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: CustomCachedNetworkImage(
                  url: image ?? '',
                  fit: BoxFit.contain,
                  width: double.infinity));
  }
}