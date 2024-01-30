import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:mega_top_mobile/features/home_screens/cubit/home_cubit.dart';
import 'package:mega_top_mobile/features/home_screens/cubit/home_states.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/search_options.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/search_result_grid.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/search_result_list_view.dart';
import '../../../../core/utils/spacer.dart';

class SearchResultList extends StatelessWidget {
  const SearchResultList({super.key});

  @override
  Widget build(BuildContext context) {
    HomeCubit homeCubit = context.read<HomeCubit>();
    return Expanded(
      child: Container(
        width: double.infinity,
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: context.width * 0.045),
          child: Column(
            children: [
              VerticalSpace(context.height * 0.028),
              const SearchOptionsRow(),
              VerticalSpace(context.height * 0.033),
              BlocConsumer<HomeCubit, HomeState>(
                listener: (context, state) {},
                builder: (context, state) {
                  return homeCubit.isGrid?const SearchResultGridView():const SearchResultListView();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}