import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/app_routes.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/features/categories_screens/cubit/category_cubit.dart';
import 'package:mega_top_mobile/features/categories_screens/cubit/category_state.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/latest_products_container.dart';

class LatestProductsList extends StatefulWidget {
  const LatestProductsList({super.key});

  @override
  State<LatestProductsList> createState() => _LatestProductsListState();
}

class _LatestProductsListState extends State<LatestProductsList> {

  late CategoryCubit categoryCubit;
  final controller = ScrollController();

  @override
  void initState() {
    final cubit = context.read<CategoryCubit>();
    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.offset) {
        cubit.hasMoreProducts = true;
        cubit.page++;
        cubit.getMoreProduct(cubit.selectedCategoryId!)
            .then((value){
          if(cubit.hasMoreProducts == true)
          {
            cubit.selectOption(AppStrings.defaultEn);
          }
          cubit.hasMoreProducts = null;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    categoryCubit = context.read<CategoryCubit>();
    return BlocConsumer<CategoryCubit, CategoryState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = context.read<CategoryCubit>();
        if(cubit.selectedCategoryModel != null){
          return SizedBox(
            height: context.height * 0.485,
            child: Row(
              children: [
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    controller: controller,
                    physics: BouncingScrollPhysics(),
                    itemCount: cubit
                        .selectedCategoryModel!
                        .data!
                        .products
                        .length,
                    itemBuilder: (context, index) {
                        return Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                cubit.setCategoryProductIndex(
                                    selectedProductIndex: index);
                                Routes.categoryProductDetailsPageRoute.moveTo;
                              },
                              child: LatestProductsContainer(
                                productName: cubit.selectedCategoryModel!.data!
                                    .products[index].title,
                                productPhoto: cubit.selectedCategoryModel!.data!
                                    .products[index].images.length==0?cubit.placeHolderImages![0]:cubit.selectedCategoryModel!.data!
                                    .products[index].images[0],
                                productType: cubit.selectedCategoryModel!.data!
                                    .products[index].categoryId!.name!,
                                productPrice: cubit.selectedCategoryModel!.data!
                                    .products[index].price!.finalPrice!
                                    .toString(),
                              ),
                            ),
                            HorizontalSpace(context.width * 0.045),
                          ],
                        );


                    },
                  ),
                ),
              ],
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
    );
  }


}
