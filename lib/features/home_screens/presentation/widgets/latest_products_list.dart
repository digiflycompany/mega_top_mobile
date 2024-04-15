import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/features/home_screens/cubit/home_cubit.dart';
import 'package:mega_top_mobile/features/home_screens/cubit/home_states.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/latest_products_container.dart';

class LatestProductsList extends StatelessWidget {
  const LatestProductsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = context.read<HomeCubit>();
        if(cubit.latestProducts.isNotEmpty){
          var latestProducts= cubit.latestProducts;
          print('ALLALALALALALLLLALALALALALLALLALALALALALLALALALALALLLLLLLLLLLLALALLA');
          print(latestProducts[0].name);
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: context.width * 0.03),
            child: SizedBox(
              height: context.height * 0.485,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: latestProducts.length,
                itemBuilder: (context, index) {
                  final latestProduct = latestProducts[index];
                  return Row(
                    children: [
                      LatestProductsContainer(
                        productName: latestProduct.name,
                        productPhoto: latestProduct.image,
                        productType: AppStrings.storageUnitsEn,
                        productPrice: latestProduct.price,
                      ),
                      HorizontalSpace(context.width * 0.045),
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
    );
  }
}
