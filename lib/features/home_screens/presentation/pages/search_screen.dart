import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/features/home_screens/cubit/home_cubit.dart';
import 'package:mega_top_mobile/features/home_screens/cubit/home_states.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/primary_app_bar.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/primary_search_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size(double.infinity, context.height * 0.089),
            child: PrimaryAppBar(AppLocalizations.of(context)!.searchForTheProduct)),
        body: BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {},
          builder: (context, state) {
            return SingleChildScrollView(
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: context.width * 0.045),
                child: Column(
                  children: [
                    VerticalSpace(context.height * 0.012),
                    const PrimarySearchBar(),

                    // homeCubit.noResult
                    //     ? VerticalSpace(context.height * 0.165)
                    //     : VerticalSpace(context.height * 0.03),
                    // homeCubit.noResult
                    //     ? const NoResultColumn()
                    //     : const LatestSearchColumn(),
                  ],
                ),
              ),
            );
          },
        ));
  }
}
