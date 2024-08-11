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
    offersCubit.initializeCheckboxes(
        [AppStrings.dellEn, AppStrings.acerEn, AppStrings.toshibaEn]);
    return BlocBuilder<OffersCubit, OffersState>(
      builder: (context, state) {
        final checkboxStates = offersCubit.checkboxStates;
        return ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: checkboxStates.length,
          separatorBuilder: (context, index) => const VerticalSpace(1),
          itemBuilder: (context, index) {
            String item = checkboxStates.keys.elementAt(index);
            bool isChecked = checkboxStates[item] ?? false;

            return InkWell(
              onTap: () => offersCubit.toggleCheckbox(item),
              child: Row(
                children: [
                  Checkbox(
                    activeColor: AppColors.primaryColor,
                    value: isChecked,
                    onChanged: (bool? newValue) {
                      offersCubit.toggleCheckbox(item);
                    },
                  ),
                  Expanded(
                      child: Text(
                    item,
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
