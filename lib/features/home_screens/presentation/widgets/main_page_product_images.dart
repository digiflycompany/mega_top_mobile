import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MainPageProductImages extends StatelessWidget {
  const MainPageProductImages({super.key, required this.images,required this.cubit});

  final List<String>? images;
  final cubit;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: images!.length,
        onPageChanged: (index) => cubit.setImageIndex(index),
        itemBuilder: (context, index) {
          return CachedNetworkImage(
            imageUrl:images![index],
            fit: BoxFit.contain,
            width: double.infinity,
            errorWidget: (context, url, error) =>
                Icon(Icons.error),
          );
        },
      ),
    );
  }
}
