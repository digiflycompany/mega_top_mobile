import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/features/categories_screens/cubit/category_state.dart';
import 'package:mega_top_mobile/features/home_screens/cubit/home_cubit.dart';
import 'package:mega_top_mobile/features/home_screens/cubit/home_cubit.dart';
import 'package:mega_top_mobile/features/home_screens/cubit/home_cubit.dart';
import 'package:mega_top_mobile/features/home_screens/cubit/home_states.dart';


class BrandsCheckListInSearch extends StatefulWidget {
  const BrandsCheckListInSearch({super.key});

  @override
  State<BrandsCheckListInSearch> createState() => _BrandsCheckListInSearchState();
}

class _BrandsCheckListInSearchState extends State<BrandsCheckListInSearch> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    HomeCubit homeCubit = context.read<HomeCubit>();

    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Scrollbar(
          thumbVisibility: true,
          controller: _scrollController,
          child: SizedBox(
            height: 200.h,
            child: ListView.separated(
              controller: _scrollController,
              shrinkWrap: true,
              itemCount: homeCubit.subCategoriesModel!.data!.subcategories.length,
              separatorBuilder: (context, index) => const VerticalSpace(1),
              itemBuilder: (context, index) {
                // String item = checkboxStates.keys.elementAt(index);
                // bool isChecked = checkboxStates[item] ?? false;

                return InkWell(
                  onTap: () => homeCubit.toggleCheckbox(index),
                  child: Row(
                    children: [
                      Checkbox(
                        activeColor: AppColors.primaryColor,
                        value: homeCubit.checkboxStates[index],
                        onChanged: (bool? newValue) {
                          homeCubit.toggleCheckbox(index);
                        },
                      ),
                      Expanded(
                          child: Text(
                        homeCubit.subCategoriesModel!.data!.subcategories[index].name!,
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
