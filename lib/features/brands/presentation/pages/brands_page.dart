import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/widgets/app_bar_fav_icon.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mega_top_mobile/features/brands/cubit/brands_cubit.dart';
import 'package:mega_top_mobile/features/brands/cubit/brands_state.dart';
import 'package:mega_top_mobile/features/brands/presentation/widgets/brands_grid.dart';

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
              /*if(state is BrandsNoInternetConnection){
              return NoInternetScreen(buttonOnTap: ()=> cubit.getBrands());
            }
            else if(cubit.BrandsModel.isNull)
            {
              return Center(
                child: Theme(
                  data: Theme.of(context).copyWith(
                    colorScheme: ColorScheme.fromSwatch().copyWith(
                      primary: AppColors.primaryColor
                    )
                  ),
                  child: CircularProgressIndicator.adaptive()
                )
              );
            }else if(cubit.BrandsModel!.data!.brands!.isNotEmpty){*/
              return Column(children: [
                Gap(context.height24),
                const BrandsGrid(),
                Gap(context.height24)
              ]);
              /*}else if(cubit.brandsModel!.data!.brands!.isEmpty){
              return EmptyDataPage(
                icon: AppAssets.emptyNotificationsIcon,
                bigFontText: AppLocalizations.of(context)!.noBrands,
                smallFontText: AppLocalizations.of(context)!.noBrandsListItems,
              );
            }
            return Center(
              child: Text(
                AppLocalizations.of(context)!.serverError,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 14.sp
                )
              )
            );*/
            })));
  }
}