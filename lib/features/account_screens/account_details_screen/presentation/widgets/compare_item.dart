import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/app_routes.dart';
import 'package:mega_top_mobile/features/account_screens/account_details_screen/presentation/cubit/compare_click_cubit.dart';
import 'package:mega_top_mobile/features/account_screens/account_details_screen/presentation/cubit/compare_click_state.dart';
import 'package:mega_top_mobile/features/account_screens/account_details_screen/presentation/widgets/account_option_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CompareItem extends StatelessWidget {
  const CompareItem(
      {super.key, this.mainIcon, this.title, this.optionalData, this.id});

  final String? mainIcon;
  final String? title;
  final Widget? optionalData;
  final String? id;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CompareClickCubit, CompareClickState>(
      listener: (context, state) {
        if (state is CompareClickSuccess) Navigator.pushNamed(
          context,
          Routes.compareProductPageRoute,
          arguments: state.isEmpty, // Pass the required argument if needed
        );
        if (state is CompareClickSuccessFromComparePage) Navigator.pushReplacementNamed(
          context,
          Routes.compareProductPageRoute,
          arguments: state.isEmpty, // Pass the required argument if needed
        );
      },
      builder: (context, state) {
        var cubit = context.read<CompareClickCubit>();
        return Padding(
            padding: EdgeInsets.only(bottom: 40.h),
            child: AccountOptionItem(
                mainIcon: mainIcon ?? AppAssets.compare,
                title: title ?? AppLocalizations.of(context)!.compareProducts,
                onTap: () => cubit.goToComparison(false)));
      }
    );
  }
}
