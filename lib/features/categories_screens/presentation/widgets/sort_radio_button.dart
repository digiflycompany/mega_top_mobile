import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import '../../cubit/category_cubit.dart';
import '../../cubit/category_state.dart';

class CustomAdaptiveRadioButton extends StatelessWidget {
  final String value;
  final String label;
  final String? description;

  const CustomAdaptiveRadioButton({
    Key? key,
    required this.value,
    required this.label,this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        CategoryCubit categoryCubit = context.read<CategoryCubit>();
        return InkWell(
          onTap: () => categoryCubit.selectOption(value),
          child: Container(
            height: context.height*0.065,
            width: double.infinity,
            padding:  EdgeInsets.symmetric(horizontal: context.width*0.022),
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                Transform.scale(
                  scale: 1.2,
                  child: Radio(
                    activeColor: AppColors.primaryColor,
                    focusColor: AppColors.primaryColor,
                    value: value,
                    groupValue: categoryCubit.selectedValue,
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        categoryCubit.selectOption(newValue);
                      }
                    },
                  ),
                ),
                Text(
                    label,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 14
                  ),
                ),
                HorizontalSpace(context.width*0.008),
                Text(
                  description!,
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 14
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}