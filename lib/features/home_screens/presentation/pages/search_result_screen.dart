import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/features/home_screens/cubit/home_cubit.dart';
import 'package:mega_top_mobile/features/home_screens/cubit/home_states.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/search_result_list.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/search_result_text.dart';

import '../../../../core/utils/app_string.dart';
import '../widgets/primary_app_bar.dart';

class SearchResultPage extends StatelessWidget {
  const SearchResultPage({super.key});

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
              body: Column(
                children: [
                  VerticalSpace(context.height * 0.028),
                  SearchResultCount(
                    searchCount: homeCubit.searchModel!.data!.products.length.toString(),
                  ),
                  VerticalSpace(context.height * 0.028),
                  const SearchResultList(),
                ],
              ));
        }
    );
  }
}
