import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/features/categories_screens/cubit/category_cubit.dart';
import 'package:mega_top_mobile/features/categories_screens/cubit/category_state.dart';

class ProductImages extends StatelessWidget {
  const ProductImages({super.key});

  @override
  Widget build(BuildContext context) {
    CategoryCubit categoryCubit = context.read<CategoryCubit>();
    return Expanded(
      child: BlocBuilder<CategoryCubit, CategoryState>(
        builder: (context, state) {
          return PageView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: categoryCubit.selectedCategoryModel!
                .data!.products[categoryCubit.selectedProductIndex].images.length,
            onPageChanged: (index) => categoryCubit.setImageIndex(index),
            itemBuilder: (context, index) {
              return CachedNetworkImage(
                imageUrl:categoryCubit.selectedCategoryModel!
                      .data!.products[categoryCubit.selectedProductIndex].images[index],
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
