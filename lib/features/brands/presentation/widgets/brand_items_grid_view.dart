import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/widgets/main_page_products_model.dart';
import 'package:mega_top_mobile/features/brands/cubit/brands_cubit.dart';
import 'package:mega_top_mobile/features/brands/cubit/brands_state.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/items_grid.dart';

class BrandItemsGridView extends StatelessWidget {
  const BrandItemsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BrandsCubit, BrandsState>(
        builder: (BuildContext context, BrandsState state) {
      return GridView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemCount: /*context
              .read<BrandsCubit>()
              .selectedCategoryModel!
              .data!
              .products
              .length*/
              13,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: context.width * 0.027,
              mainAxisSpacing: context.height * 0.019,
              childAspectRatio: 0.68),
          itemBuilder: (BuildContext context, int index) {
            return Padding(
                padding: EdgeInsetsDirectional.only(
                    end: context.width * 0.011,
                    start: context.width * 0.011,
                    top: context.height * 0.004),
                child: ProductsGridContainer(
                    index: index,
                    discountPercent: "17% ",
                    discount: false,
                    product: /*context
                    .read<BrandsCubit>()
                    .selectedCategoryModel!
                    .data!
                    .products[index]*/
                        Product(
                            id: 'id',
                            title: 'title',
                            titleAr: 'titleAr',
                            description: 'description',
                            quantity: 15,
                            categoryId: Category(
                                id: 'id', name: 'name', nameAr: 'nameAr'),
                            subcategoryId: [],
                            price: Price(originalPrice: 14, finalPrice: 0414),
                            currency: 'currency',
                            images: [
                              'https://new.riverstoneelectronics.com.au/wp-content/uploads/2013/11/electronic-gifts-for-men1.jpg'
                            ],
                            unitsSold: 14,
                            addedBy: AddedBy(
                                id: 'id', fullName: 'fullName', email: 'email'),
                            active: true,
                            createdAt: 'createdAt',
                            updatedAt: 'updatedAt',
                            v: 1414),
                    onTap: () {
                      /*context.read<CategoryCubit>().setCategoryProductIndex(selectedProductIndex: index);
                  Routes.categoryProductDetailsPageRoute.moveTo;*/
                    }));
          });
    });
  }
}
