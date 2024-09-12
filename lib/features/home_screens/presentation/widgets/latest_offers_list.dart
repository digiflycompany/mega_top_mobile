import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/features/categories_screens/cubit/category_cubit.dart';
import 'package:mega_top_mobile/features/categories_screens/cubit/category_state.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/best_seller_container.dart';

class LatestOffersList extends StatelessWidget {
  const LatestOffersList({super.key,d, required this.categoryId});

  final String categoryId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=> CategoryCubit()..getSelectedCategories(categoryId),
      child: BlocConsumer<CategoryCubit, CategoryState>(
        listener: (BuildContext context, CategoryState state) {},
        builder: (BuildContext context, CategoryState state) {
        //  final homeCubit = context.read<HomeCubit>();
          final cubit = context.read<CategoryCubit>();
             if (cubit.selectedCategoryModel.isNotNull) {
            return SizedBox(
              height: context.height * 0.485,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context,index){
                          return BestSellerContainer(
                            productName: cubit.selectedCategoryModel!.data!
                                .products[index].title,
                            productPhoto: cubit.selectedCategoryModel!.data!
                                .products[index].images![0],
                            productType: cubit.selectedCategoryModel!.data!
                                .products[index].categoryId.name,
                            productPrice: cubit.selectedCategoryModel!.data!
                                .products[index].price.finalPrice
                                .toString(),
                          );
                        }, separatorBuilder: (context,index){
                      return SizedBox(
                        width: 10.w,
                      );
                    }, itemCount: 4),
                  )
                ],
              ),
            );
         }
          else {
            return Center(child: CircularProgressIndicator.adaptive());
          }
       },
      ),
    );
  }
}
