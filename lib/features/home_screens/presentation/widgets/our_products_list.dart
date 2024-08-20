import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/features/categories_screens/cubit/category_cubit.dart';
import 'package:mega_top_mobile/features/categories_screens/cubit/category_state.dart';

import '../../../../core/utils/spacer.dart';
import 'our_products_container.dart';

class OurProductsList extends StatelessWidget {
  const OurProductsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoryCubit()..getCategories(),
      child: BlocConsumer<CategoryCubit, CategoryState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = context.read<CategoryCubit>();
          if (cubit.categoriesModel != null) {
            var categories = cubit.categoriesModel;
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: context.width * 0.03),
              child: SizedBox(
                height: context.height * 0.14,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    final category = categories!.data!.categories![index];
                    return Row(
                      children: [
                        OurProductsContainer(
                          productPhoto: category.image,
                          productName: category.name,
                          // productQuantity:
                          //     category.count.toString() + AppStrings.products,
                          categoryId: category.id,
                          index: index,
                        ),
                        HorizontalSpace(
                            context.width * 0.045), // Space between items
                      ],
                    );
                  },
                ),
              ),
            );
          }
          return Center(
            child: Theme(
              data: Theme.of(context).copyWith(
                colorScheme: ColorScheme.fromSwatch().copyWith(
                  primary: AppColors.primaryColor,
                ),
              ),
              child: CircularProgressIndicator.adaptive(),
            ),
          );
        },
      ),
    );
  }
}
