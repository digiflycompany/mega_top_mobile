import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/features/categories_screens/cubit/category_cubit.dart';
import 'package:mega_top_mobile/features/categories_screens/cubit/category_state.dart';
import 'package:mega_top_mobile/features/categories_screens/presentation/widgets/categories_small_card.dart';

class CategoriesGrid extends StatelessWidget {
  const CategoriesGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoryCubit, CategoryState>(
        listener: (BuildContext context, CategoryState state) {},
        builder: (context, state) {
          var cubit = context.read<CategoryCubit>();
          var categories = cubit.categoriesModel;
          return Expanded(
              child: GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: categories!.data!.categories!.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 16.w,
                    mainAxisSpacing: 16.h,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    final category = categories.data!.categories![index];
                    return CategoriesSmallCard(
                        index: index,
                        categoryId: category.id,
                        categoryPhoto: category.image,
                        categoryName: category.name ?? 'Unknown');
                  }));
        });
  }
}