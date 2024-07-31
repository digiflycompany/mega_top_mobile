import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubit/category_cubit.dart';
import '../../cubit/category_state.dart';

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
              return Image.network(
                  categoryCubit.selectedCategoryModel!
                      .data!.products[categoryCubit.selectedProductIndex].images[index],

              );
            },
          );
        },
      ),
    );
  }
}
