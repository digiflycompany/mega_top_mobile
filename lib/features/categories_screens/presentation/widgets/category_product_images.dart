import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubit/category_cubit.dart';
import '../../cubit/category_state.dart';

class ProductImages extends StatelessWidget {
  const ProductImages({super.key, required this.images,required this.cubit});

  final List<String> images;
  final cubit;

  @override
  Widget build(BuildContext context) {
    CategoryCubit categoryCubit = context.read<CategoryCubit>();
    return Expanded(
      child: BlocBuilder<CategoryCubit, CategoryState>(
        builder: (context, state) {
          return PageView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: images.length,
            onPageChanged: (index) => cubit.setImageIndex(index),
            itemBuilder: (context, index) {
              return Image.network(
                images[index],
                  // categoryCubit.selectedCategoryModel!
                  //     .data!.products[categoryCubit.selectedProductIndex].images[index],

              );
            },
          );
        },
      ),
    );
  }
}
