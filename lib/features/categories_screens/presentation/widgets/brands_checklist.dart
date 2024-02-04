import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/features/categories_screens/cubit/category_state.dart';
import '../../cubit/category_cubit.dart';

class BrandsCheckList extends StatelessWidget {
  const BrandsCheckList({super.key});

  @override
  Widget build(BuildContext context) {
    CategoryCubit categoryCubit = context.read<CategoryCubit>();
    categoryCubit.initializeCheckboxes([AppStrings.dellEn,AppStrings.acerEn,AppStrings.toshibaEn]);
    return BlocBuilder<CategoryCubit, CategoryState>(
    builder: (context, state) {
      final checkboxStates = categoryCubit.checkboxStates;
      return ListView.separated(
        shrinkWrap: true,
        itemCount: checkboxStates.length,
        separatorBuilder: (context, index) => const VerticalSpace(1),
        itemBuilder: (context, index) {
          String item = checkboxStates.keys.elementAt(index);
          bool isChecked = checkboxStates[item] ?? false;

          return InkWell(
            onTap: () => categoryCubit.toggleCheckbox(item),
            child: Row(
              children: [
                Checkbox(
                  activeColor: AppColors.primaryColor,
                  value: isChecked,
                  onChanged: (bool? newValue) {
                    categoryCubit.toggleCheckbox(item);
                  },
                ),
                Expanded(
                    child:Text(
                  item,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 14
                  ),
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
