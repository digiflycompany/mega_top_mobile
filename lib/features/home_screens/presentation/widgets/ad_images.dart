import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AdImages extends StatelessWidget {
  const AdImages({super.key, this.images});
  final List<String>? images;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: PageView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: images!.length,
            onPageChanged: (index) {}/*=> cubit.setImageIndex(index)*/,
            itemBuilder: (context, index) {
              return CachedNetworkImage(
                  imageUrl:images![index],
                  fit: BoxFit.contain,
                  width: double.infinity,
                  errorWidget: (context, url, error) =>
                      Icon(Icons.error)
              );
            }
        )
    );
  }
}
