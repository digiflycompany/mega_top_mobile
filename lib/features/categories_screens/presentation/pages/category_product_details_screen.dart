import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/app_routes.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/widgets/add_to_cart_button.dart';
import 'package:mega_top_mobile/core/widgets/button_bottom_nav_bar.dart';
import 'package:mega_top_mobile/core/widgets/product_detailed_image.dart';
import 'package:mega_top_mobile/core/widgets/product_details_app_bar.dart';
import 'package:mega_top_mobile/features/categories_screens/cubit/category_cubit.dart';
import 'package:mega_top_mobile/features/categories_screens/cubit/category_state.dart';
import 'package:mega_top_mobile/services/shared_preferences/preferences_helper.dart';

import '../../../../core/widgets/status_bar_color.dart';
import '../widgets/product_detailed_body.dart';

class CategoryProductDetailsPage extends StatefulWidget {
  const CategoryProductDetailsPage({super.key});

  @override
  State<CategoryProductDetailsPage> createState() =>
      _CategoryProductDetailsPageState();
}

class _CategoryProductDetailsPageState
    extends State<CategoryProductDetailsPage> {
  late CategoryCubit categoryCubit;

  @override
  Widget build(BuildContext context) {
    const CustomStatusBarColor(color: AppColors.onboardingBackgroundColor);
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size(double.infinity, context.height * 0.089),
            child: const ProductDetailsAppBar()),
        body: BlocBuilder<CategoryCubit, CategoryState>(
          builder: (BuildContext context, CategoryState state) {
            categoryCubit = context.read<CategoryCubit>();
            return const SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  ProductDetailedImage(),
                  ProductDetailedBody(),
                ],
              ),
            );
          },
        ),
        bottomNavigationBar: ButtonBottomNavBar(
          button: AddToCartButton(
            onTap: () async{
              final token = await PreferencesHelper.getToken();
              if(token == null){
                Routes.signUpOrLoginPageRoute.moveTo;
              }else{
                categoryCubit.showAddedToCartBottomSheet(context);
              }
            },
          ),
        ));
  }

  @override
  void dispose() {
    categoryCubit.setImageIndex(0);
    super.dispose();
  }
}
