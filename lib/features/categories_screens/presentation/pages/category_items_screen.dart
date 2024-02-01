import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:mega_top_mobile/features/categories_screens/cubit/category_cubit.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/search_options.dart';
import '../../../../core/utils/app_string.dart';
import '../../../home_screens/presentation/widgets/primary_app_bar.dart';

class CategoryItemsPage extends StatelessWidget {
  const CategoryItemsPage({super.key});

  @override
  Widget build(BuildContext context) {
    CategoryCubit categoryCubit = context.read<CategoryCubit>();
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(double.infinity, context.height * 0.089),
          child: const PrimaryAppBar(AppStrings.upsEn)),
      body:  Padding(
        padding: EdgeInsets.symmetric(horizontal: context.width*0.045),
        child:  Column(
          children: [
            ItemsOptionsRow(topPadding:context.height * 0.028,bottomPadding: context.height * 0.033,),
          ],
        ),
      ),
    );
  }
}
