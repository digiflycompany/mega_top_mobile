/*
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/utils/logger.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/core/widgets/add_to_cart_button.dart';
import 'package:mega_top_mobile/core/widgets/button_bottom_nav_bar.dart';
import 'package:mega_top_mobile/core/widgets/button_circular_progress.dart';
import 'package:mega_top_mobile/core/widgets/no_internet_page.dart';
import 'package:mega_top_mobile/core/widgets/product_details_app_bar.dart';
import 'package:mega_top_mobile/core/widgets/status_bar_color.dart';
import 'package:mega_top_mobile/features/cart_screens/data/repositories/cart_repo.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/cubit/cart_cubit.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/cubit/cart_states.dart';
import 'package:mega_top_mobile/features/categories_screens/cubit/category_cubit.dart';
import 'package:mega_top_mobile/features/categories_screens/cubit/category_state.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mega_top_mobile/features/home_screens/cubit/ad_details_cubit.dart';
import 'package:mega_top_mobile/features/home_screens/cubit/ad_details_state.dart';
import 'package:mega_top_mobile/features/home_screens/data/models/ad_details_model.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/ad_details_body.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/ad_details_image.dart';
import 'package:shimmer/shimmer.dart';

class AdDetailsScreen extends StatefulWidget {
  const AdDetailsScreen({required this.id});

  final String id;

  @override
  State<AdDetailsScreen> createState() => _AdDetailsScreenState();
}

class _AdDetailsScreenState extends State<AdDetailsScreen> {
  @override
  void initState() {
    AdDetailsCubit.get(context).fetchAdDetails(widget.id);
    super.initState();
  }

  AdDetailsModel? ad;

  @override
  Widget build(BuildContext context) {
    const CustomStatusBarColor(color: AppColors.onboardingBackgroundColor);
    return BlocBuilder<AdDetailsCubit, AdDetailsState>(
      builder: (context, state) {
        var cubit = AdDetailsCubit.get(context);
        if (state is AdSuccessState) ad = state.data;
        return Scaffold(
            appBar: PreferredSize(
                preferredSize: Size(double.infinity, context.height * 0.089),
                child: const ProductDetailsAppBar()),
            body: state is NoInternetState
                ? Padding(
                    padding: EdgeInsets.only(bottom: context.height48),
                    child: NoInternetScreen(
                        buttonOnTap: () => cubit.fetchAdDetails(widget.id)))
                : SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: !(state is AdErrorState)
                        ? Column(children: [
                            state is AdSuccessState
                                ? AdDetailsImage(ad: state.data.data!)
                                : Shimmer.fromColors(
                                    baseColor: Colors.grey[300]!,
                                    highlightColor: Colors.grey[100]!,
                                    child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: context.height12,
                                            horizontal: context.width8),
                                        child: Container(
                                            height: context.height *
                                                0.338, // Adjust to match the original container's height
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        context.height *
                                                            0.0065))))),
                            state is AdSuccessState
                                ? AdDetailsBody(ad: ad!.data!)
                                : Shimmer.fromColors(
                                    baseColor: Colors.grey[300]!,
                                    highlightColor: Colors.grey[100]!,
                                    child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: context.height12,
                                            horizontal: context.width8),
                                        child: Container(
                                            height: context.height *
                                                0.338, // Adjust to match the original container's height
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        context.height *
                                                            0.0065)))))
                          ])
                        : Text(state.errorMessage)),
            bottomNavigationBar: state is NoInternetState
                ? null
                : ButtonBottomNavBar(button:
                    BlocBuilder<CategoryCubit, CategoryState>(
                        builder: (context, state) {
                    return BlocProvider(
                        create: (context) => CartCubit(CartRepoImp()),
                        child: BlocConsumer<CartCubit, CartState>(
                            listener: (context, state) {
                          if (state is CartUpdated) {
                            context
                                .read<CartCubit>()
                                .showAddedToCartBottomSheet(context);
                          }
                        }, builder: (context, state) {
                          return AddToCartButton(
                              content: state is CartSentToAPILoading
                                  ? const ButtonCircularProgress()
                                  : Row(children: [
                                      SvgPicture.asset(AppAssets.cartButtonIcon,
                                          width: context.width * 0.066),
                                      HorizontalSpace(context.width * 0.022),
                                      Text(
                                          AppLocalizations.of(context)!
                                              .addToCart,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 16.sp))
                                    ]),
                              onTap: () async {
                                if (ad != null) {
                                  context.read<CartCubit>().addProductToCart(
                                      ad!.data!.id!,
                                      ad!.data?.title,
                                      ad!.data?.price?.finalPrice.toString(),
                                      ad!.data?.images?[0]);
                                  DefaultLogger.logger.d('Product added to cart ${ad!.data?.id}');
                                }
                              });
                        }));
                  })));
      },
    );
  }
}
*/
