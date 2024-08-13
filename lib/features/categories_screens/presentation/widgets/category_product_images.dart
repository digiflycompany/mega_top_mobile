import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/features/categories_screens/cubit/category_cubit.dart';
import 'package:mega_top_mobile/features/categories_screens/cubit/category_state.dart';

class ProductImages extends StatelessWidget {
  const ProductImages({super.key, required this.images,required this.cubit});

  final List<String> images;
  final cubit;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<CategoryCubit, CategoryState>(
        builder: (context, state) {
          return PageView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: images.length,
            onPageChanged: (index) => cubit.setImageIndex(index),
            itemBuilder: (context, index) {
              return CachedNetworkImage(
                imageUrl:images[index],
                fit: BoxFit.fill,
                width: double.infinity,
                errorWidget: (context, url, error) =>
                    Icon(Icons.error),
              );
            },
          );
        },
      ),
    );
  }
}
