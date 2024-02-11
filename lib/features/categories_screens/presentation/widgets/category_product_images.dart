import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
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
            itemCount: categoryCubit.images.length,
            onPageChanged:(index)=> categoryCubit.setImageIndex(index),
            itemBuilder: (context, index) {
              return Center(
                child: Image.asset(categoryCubit.images[index], width: context.width * 0.4),
              );
            },
          );
        },
      ),
    );
  }
}
