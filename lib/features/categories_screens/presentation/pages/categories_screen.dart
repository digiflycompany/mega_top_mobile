import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/core/widgets/app_bar_fav_icon.dart';
import 'package:mega_top_mobile/core/widgets/no_internet_page.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/widgets/empty_response_page.dart';
import 'package:mega_top_mobile/features/categories_screens/cubit/category_cubit.dart';
import 'package:mega_top_mobile/features/categories_screens/cubit/category_state.dart';
import 'package:mega_top_mobile/features/categories_screens/presentation/widgets/categories_grid.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CategoryCubit>();
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(double.infinity, context.height * 0.089),
          child: CustomFavouriteAppBar(AppLocalizations.of(context)!.categories)),
      body: Padding(
            padding: EdgeInsets.symmetric(horizontal: context.width * 0.045),
            child: BlocBuilder<CategoryCubit,CategoryState>(
              builder: (BuildContext context, CategoryState state) {
                if(state is CategoryNoInternetConnection){
                  return NoInternetScreen(buttonOnTap: ()=> cubit.getCategories());
                }
                else if(cubit.categoriesModel.isNull)
                {
                  return Center(
                    child: Theme(
                      data: Theme.of(context).copyWith(
                        colorScheme: ColorScheme.fromSwatch().copyWith(
                          primary: AppColors.primaryColor,
                        ),
                      ),
                      child: CircularProgressIndicator.adaptive(),
                    ),
                  );
                }else if(cubit.categoriesModel!.data!.categories!.length > 0){
                 return Column(
                    children: [
                      VerticalSpace(context.height24),
                      const CategoriesGrid(),
                      VerticalSpace(context.height24),
                    ],
                  );
                }else if(cubit.categoriesModel!.data!.categories!.length == 0){
                 return EmptyDataPage(
                    icon: AppAssets.emptyNotificationsIcon,
                    bigFontText: AppStrings.noCategoriesEn,
                    smallFontText: AppStrings.noCategoriesListItemsEn,
                  );
                }
                  return Center(
                    child: Text(
                      AppStrings.serverError,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 14.sp
                      ),
                    ),
                  );
              },
            ),
          ),
    );
  }
}
