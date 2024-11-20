import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/features/brands/cubit/brands_cubit.dart';
import 'package:mega_top_mobile/features/brands/cubit/brands_state.dart';
import 'package:mega_top_mobile/features/brands/presentation/widgets/brands_small_card.dart';

class BrandsGrid extends StatelessWidget {
  const BrandsGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BrandsCubit, BrandsState>(
        listener: (BuildContext context, BrandsState state) {},
        builder: (context, state) {
          var cubit = context.read<BrandsCubit>();
          var brands = cubit.brands;
          return Expanded(
              child: GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: brands.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 16.w,
                      mainAxisSpacing: 16.h),
                  itemBuilder: (BuildContext context, int index) {
                    final brand = brands[index];
                    return BrandsSmallCard(brand: brand);
                  }));
        });
  }
}