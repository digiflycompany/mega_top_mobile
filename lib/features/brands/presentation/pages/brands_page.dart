import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/widgets/app_bar_fav_icon.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mega_top_mobile/core/widgets/no_internet_page.dart';
import 'package:mega_top_mobile/features/brands/cubit/brands_cubit.dart';
import 'package:mega_top_mobile/features/brands/cubit/brands_state.dart';
import 'package:mega_top_mobile/features/brands/presentation/widgets/brands_grid.dart';
import 'package:mega_top_mobile/features/brands/presentation/widgets/brands_shimmer.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/widgets/empty_response_page.dart';

class BrandsPage extends StatelessWidget {
  const BrandsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size(double.infinity, context.height * 0.089),
            child: CustomFavouriteAppBar(AppLocalizations.of(context)!.brands)),
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: context.width * 0.045),
            child: BlocBuilder<BrandsCubit, BrandsState>(
                builder: (BuildContext context, BrandsState state) {
              var cubit = BrandsCubit.get(context);
              if (state is BrandsLoadingState)
                return const BrandsShimmer();
              else if (state is BrandsNoInternetConnection) {
                return NoInternetScreen(buttonOnTap: () => cubit.getBrands());
              } else if (cubit.brands.isNotEmpty) {
                return Column(children: [
                  Gap(context.height24),
                  const BrandsGrid(),
                  Gap(context.height24)
                ]);
              } else if (cubit.brands.isEmpty) {
                return EmptyDataPage(
                  icon: AppAssets.emptyNotificationsIcon,
                  bigFontText: AppLocalizations.of(context)!.noBrands,
                  smallFontText:
                      AppLocalizations.of(context)!.noBrandsListItems,
                );
              }
              return Center(
                  child: Text(AppLocalizations.of(context)!.serverError,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 14.sp)));
            })));
  }
}
