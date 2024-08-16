import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/features/home_screens/cubit/home_cubit.dart';
import 'package:mega_top_mobile/features/home_screens/cubit/home_states.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/no_result_column.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/search_result_list.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/search_result_text.dart';

import '../../../../core/utils/app_string.dart';
import '../widgets/primary_app_bar.dart';

class SearchResultPage extends StatefulWidget {
  const SearchResultPage({super.key});

  @override
  State<SearchResultPage> createState() => _SearchResultPageState();
}

  final controller = ScrollController();
  late HomeCubit homeCubit;

class _SearchResultPageState extends State<SearchResultPage> {

  @override
  void initState() {
    final cubit = context.read<HomeCubit>();
    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.offset) {
        cubit.hasMoreProducts = true;
        cubit.page++;
        cubit.getMoreProduct()
            .then((value){
          if(cubit.hasMoreProducts == true)
          {
            cubit.selectOption(AppStrings.defaultEn);
          }
          cubit.hasMoreProducts = null;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
        builder: (BuildContext context, state){
          HomeCubit homeCubit = context.read<HomeCubit>();
          return Scaffold(
              backgroundColor: AppColors.circleAvatarBackground,
              appBar: PreferredSize(
                  preferredSize: Size(double.infinity, context.height * 0.089),
                  child: PrimaryAppBar(homeCubit.searchWord.text)),
              body: homeCubit.searchModel.isNull ? Center(child: CircularProgressIndicator()) : homeCubit.searchModel!.data!.products.isNotEmpty ? Column(
                children: [
                  VerticalSpace(context.height * 0.028),
                  SearchResultCount(
                    searchCount: homeCubit.searchModel!.data!.products.length.toString(),
                  ),
                  VerticalSpace(context.height * 0.028),
                  SearchResultList(controller: controller,),
                ],
              ): SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    NoResultColumn(),
                  ],
                ),
              ));
        }
    );
  }
  @override
  void dispose() {
    homeCubit.searchModel = null;
    homeCubit.selectOption(AppStrings.defaultEn);
    homeCubit.page = 1;
    homeCubit.minPriceController.clear();
    homeCubit.maxPriceController.clear();
    homeCubit.minPrice = null;
    homeCubit.maxPrice = null;
    super.dispose();
  }
}
