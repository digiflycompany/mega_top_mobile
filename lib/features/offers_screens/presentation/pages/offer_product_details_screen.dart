import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/widgets/add_to_cart_button.dart';
import 'package:mega_top_mobile/core/widgets/button_bottom_nav_bar.dart';
import 'package:mega_top_mobile/core/widgets/product_detailed_image.dart';
import 'package:mega_top_mobile/core/widgets/product_details_app_bar.dart';
import 'package:mega_top_mobile/features/offers_screens/cubit/offers_cubit.dart';
import 'package:mega_top_mobile/features/offers_screens/cubit/offers_state.dart';
import 'package:mega_top_mobile/features/offers_screens/presentation/widgets/product_detailed_body.dart';

import '../../../../core/widgets/status_bar_color.dart';

class OfferProductDetailsPage extends StatefulWidget {
  const OfferProductDetailsPage({super.key});

  @override
  State<OfferProductDetailsPage> createState() =>
      _OfferProductDetailsPageState();
}

class _OfferProductDetailsPageState
    extends State<OfferProductDetailsPage> {
  late OffersCubit offerCubit;

  @override
  Widget build(BuildContext context) {
    const CustomStatusBarColor(color: AppColors.onboardingBackgroundColor);
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size(double.infinity, context.height * 0.089),
            child: const ProductDetailsAppBar()),
        body: BlocBuilder<OffersCubit, OffersState>(
          builder: (BuildContext context, OffersState state) {
            offerCubit = context.read<OffersCubit>();
            return  SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  ProductDetailedImage(images: offerCubit.offerModel!.data!.products[offerCubit.selectedProductIndex].images,
                  imagePosition: offerCubit.currentImageIndex,),
                  ProductDetailedBody(),
                ],
              ),
            );
          },
        ),
        bottomNavigationBar: ButtonBottomNavBar(
          button: AddToCartButton(
            onTap: () => offerCubit.showAddedToCartBottomSheet(context),
          ),
        ));
  }

  @override
  void dispose() {
    offerCubit.setImageIndex(0);
    super.dispose();
  }
}
