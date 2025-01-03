import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/core/utils/app_routes.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/features/categories_screens/cubit/category_cubit.dart';
import 'package:mega_top_mobile/features/categories_screens/cubit/category_state.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/items_list.dart';


class CategoryItemsListView extends StatelessWidget {
  const CategoryItemsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (BuildContext context, CategoryState state) {
        final cubit = context.read<CategoryCubit>();
        return ListView.builder(
       //   scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemCount: cubit
              .selectedCategoryModel!
              .data!
              .products
              .length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: EdgeInsetsDirectional.only(
                  end: context.width * 0.011,
                  start: context.width * 0.011,
                  bottom: context.height * 0.027,
                  top: context.height * 0.006),
              child: ProductsListContainer(
                index : index,
                productName: cubit.selectedCategoryModel!.data!.products[index].title,
                productPhoto: cubit.selectedCategoryModel!.data!
                    .products[index].images!.length==0?context.read<CategoryCubit>().placeHolderImages![0]:cubit.selectedCategoryModel!.data!
                    .products[index].images![0],
                productType: cubit.selectedCategoryModel!.data!.products[index].categoryId.name,
                productPrice: cubit.selectedCategoryModel!.data!.products[index].price.finalPrice.toString(),
             onTap: (){
               cubit.setCategoryProductIndex(selectedProductIndex: index);
               Routes.categoryProductDetailsPageRoute.moveTo;
             },
             //   discountPercent: product.discountPercent,
             //   discount: product.discount,
              ),
            );
          },
        );
      },
    );
  }
}
