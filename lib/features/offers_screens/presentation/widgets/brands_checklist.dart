import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/features/categories_screens/cubit/category_state.dart';
import 'package:mega_top_mobile/features/offers_screens/cubit/offers_cubit.dart';
import 'package:mega_top_mobile/features/offers_screens/cubit/offers_state.dart';


class BrandsCheckList extends StatelessWidget {
  const BrandsCheckList({super.key});

  @override
  Widget build(BuildContext context) {
    OffersCubit offersCubit = context.read<OffersCubit>();
    return BlocBuilder<OffersCubit, OffersState>(
      builder: (context, state) {
        final checkboxStates = offersCubit.checkboxStates;
        return ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: checkboxStates.length,
          separatorBuilder: (context, index) => const VerticalSpace(1),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () => offersCubit.toggleCheckbox(index),
              child: Row(
                children: [
                  Checkbox(
                    activeColor: AppColors.primaryColor,
                    value: offersCubit.checkboxStates[index],
                    onChanged: (bool? newValue) {
                      offersCubit.toggleCheckbox(index);
                    },
                  ),
                  Expanded(
                      child: Text(
                        offersCubit.subCategoriesModel!.data!.subcategories[index].name!,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 14.sp),
                  )),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
