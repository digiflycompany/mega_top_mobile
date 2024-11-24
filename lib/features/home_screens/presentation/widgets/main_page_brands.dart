import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:mega_top_mobile/features/brands/cubit/brands_cubit.dart';
import 'package:mega_top_mobile/features/brands/cubit/brands_state.dart';
import 'package:mega_top_mobile/features/brands/presentation/pages/brand_products_page.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/brand_container.dart';

class MainPageBrands extends StatelessWidget {
  const MainPageBrands({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 82.h,
        child: BlocBuilder<BrandsCubit, BrandsState>(builder: (context, state) {
          var cubit = BrandsCubit.get(context);
          if (state is BrandsFailureState) return Text(state.error);
          if (state is BrandsLoadingState) {
            return const BrandShimmer();
          }
          return Row(children: [
            Expanded(
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return BrandContainer(
                          brand: cubit.brands[index],
                          onTap: () {
                            cubit.selectBrand(cubit.brands[index]);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => BrandProductsPage(
                                        brandName:
                                            cubit.brands[index].name ?? '')));
                            cubit.getBrandProducts();
                          });
                    },
                    separatorBuilder: (context, index) {
                      return Gap(16.w);
                    },
                    itemCount: 5))
          ]);
        }));
  }
}