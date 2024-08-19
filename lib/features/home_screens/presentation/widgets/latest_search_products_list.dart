import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/app_routes.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/features/home_screens/cubit/home_cubit.dart';
import 'package:mega_top_mobile/features/home_screens/cubit/home_states.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/latest_products_container.dart';

class LatestSearchProductsList extends StatefulWidget {
  const LatestSearchProductsList({super.key});

  @override
  State<LatestSearchProductsList> createState() => _LatestSearchProductsListState();
}

class _LatestSearchProductsListState extends State<LatestSearchProductsList> {

  late HomeCubit homeCubit;
  final controller = ScrollController();

  @override
  void initState() {
    final cubit = context.read<HomeCubit>();
    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.offset) {
        cubit.hasMoreProducts = true;
        cubit.page++;
        cubit.getMoreProduct()
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
    homeCubit = context.read<HomeCubit>();
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = context.read<HomeCubit>();
        if(cubit.searchModel != null){
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
                        .searchModel!
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
                                Routes.searchProductDetailsPageRoute.moveTo;
                              },
                              child: LatestProductsContainer(
                                productName: cubit.searchModel!.data!
                                    .products[index].title,
                                productPhoto: cubit.searchModel!.data!
                                    .products[index].images[0],
                                productType: cubit.searchModel!.data!
                                    .products[index].categoryId!.name!,
                                productPrice: cubit.searchModel!.data!
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
