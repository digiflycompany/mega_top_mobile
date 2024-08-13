import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/features/categories_screens/cubit/category_state.dart';

import '../../cubit/category_cubit.dart';

class BrandsCheckList extends StatefulWidget {
  const BrandsCheckList({super.key});

  @override
  State<BrandsCheckList> createState() => _BrandsCheckListState();
}

class _BrandsCheckListState extends State<BrandsCheckList> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    CategoryCubit categoryCubit = context.read<CategoryCubit>();

    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        return Scrollbar(
          thumbVisibility: true,
          controller: _scrollController,
          child: SizedBox(
            height: 200.h,
            child: ListView.separated(
              controller: _scrollController,
              shrinkWrap: true,
              itemCount: categoryCubit.subCategoriesModel!.data!.subcategories.length,
              separatorBuilder: (context, index) => const VerticalSpace(1),
              itemBuilder: (context, index) {
                // String item = checkboxStates.keys.elementAt(index);
                // bool isChecked = checkboxStates[item] ?? false;

                return InkWell(
                  onTap: () => categoryCubit.toggleCheckbox(index),
                  child: Row(
                    children: [
                      Checkbox(
                        activeColor: AppColors.primaryColor,
                        value: categoryCubit.checkboxStates[index],
                        onChanged: (bool? newValue) {
                          categoryCubit.toggleCheckbox(index);
                        },
                      ),
                      Expanded(
                          child: Text(
                        categoryCubit.subCategoriesModel!.data!.subcategories[index].name!,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 14.sp),
                      )),
                    ],
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
