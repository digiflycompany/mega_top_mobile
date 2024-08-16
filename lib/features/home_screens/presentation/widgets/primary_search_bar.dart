import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/features/home_screens/cubit/home_states.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/filter_box.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/search_text_field.dart';

import '../../../../core/utils/app_routes.dart';
import '../../cubit/home_cubit.dart';

class PrimarySearchBar extends StatefulWidget {
  const PrimarySearchBar({super.key});

  @override
  State<PrimarySearchBar> createState() => _PrimarySearchBarState();
}

class _PrimarySearchBarState extends State<PrimarySearchBar> {
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    HomeCubit homeCubit = context.read<HomeCubit>();
    return Padding(
      padding: EdgeInsets.symmetric(vertical: context.height * 0.012),
      child: GestureDetector(
        onTap: () {
          Routes.searchPageRoute.moveTo;
        },
        child: Container(
          width: double.infinity,
          height: context.height * 0.068,
          decoration: BoxDecoration(
            color: AppColors.circleAvatarBackground,
            borderRadius: BorderRadius.circular(context.height * 0.006),
          ),
          child: Row(
            children: [
              HorizontalSpace(context.width * 0.045),
              GestureDetector(
                  onTap: () {
                    if(homeCubit.searchWord.text.isNotNullOrEmpty)
                      {
                        homeCubit.search();
                        Routes.searchResultPageRoute.moveTo;
                      }
                  },
                  child: SvgPicture.asset(AppAssets.searchIcon)),
              HorizontalSpace(context.width * 0.022),
              SearchTextField(
                onFieldSubmitted: (){
                  if(homeCubit.searchWord.text.isNotNullOrEmpty)
                  {
                    homeCubit.search();
                    Routes.searchResultPageRoute.moveTo;
                  }
                },
                textFormField: homeCubit.searchWord,
                focusNode: _focusNode,
              ),
              BlocConsumer<HomeCubit, HomeState>(
                listener: (context, state) {},
                builder: (context, state) {
                  return FilterContainer(
                    onTap: () {
                      homeCubit.toggleNoResult();
                    },
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
