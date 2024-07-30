import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';

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

            ///Error
            // itemCount: categoryCubit.selectedCategoryModel!
            //     .productList[categoryCubit.selectedProductIndex].images.length,
            onPageChanged: (index) => categoryCubit.setImageIndex(index),
            itemBuilder: (context, index) {
              return Center(
                child: Image.network(

                    ///Error
                    "",
                    // categoryCubit
                    //     .selectedCategoryModel!
                    //     .productList[categoryCubit.selectedProductIndex]
                    //     .images[index]
                    //     .src,
                    width: context.width * 0.4),
              );
            },
          );
        },
      ),
    );
  }
}
