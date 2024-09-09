import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mega_top_mobile/core/widgets/big_circular_progress_indicator.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  const CustomCachedNetworkImage(
      {super.key,
        required this.url,
        this.width,
        this.height,
        this.radius,
        this.fit,
        this.loadingSize,
        this.withLoading = true});
  final String url;
  final double? width, height, radius, loadingSize;
  final BoxFit? fit;
  final bool withLoading;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
        fit: fit ?? BoxFit.fill,
        height: height ?? 102,
        width: width ?? 102,
        imageUrl: url,
        errorWidget: (context, url, error) => const ClipOval(
            child: Icon(Icons.error)),
        progressIndicatorBuilder: withLoading
            ? (context, url, progress) => SizedBox(
            width: (loadingSize ?? 170) + 10,
            child: Center(child: BigCircularProgressIndicator()))
            : null,
        imageBuilder: (context, imageProvider) => Container(
            width: width ?? 148,
            height: height ?? 131,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(radius ?? 20),
                image: DecorationImage(
                    image: imageProvider, fit: fit ?? BoxFit.fill))));
  }
}
