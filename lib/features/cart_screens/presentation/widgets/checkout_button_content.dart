import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/utils/locale/locale_cubit.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/cubit/cart_cubit.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/cubit/cart_states.dart';
import 'package:mega_top_mobile/services/shared_preferences/preferences_helper.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CheckoutButtonContent extends StatelessWidget {
  const CheckoutButtonContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        final cartSummary = PreferencesHelper.getCartSummary();
        if (PreferencesHelper.getCart().isNotEmpty) {
          return Row(
            children: [
              /// Product Quantity
              Text(
                "${cartSummary['totalItems']}",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 14.sp,
                ),
              ),
              HorizontalSpace(context.width * 0.011),
              /// Products Text
              Text(
                AppLocalizations.of(context)!.productsCart,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 14.sp,
                ),
              ),
              HorizontalSpace(context.width * 0.022),

              /// Product Price
              Text(
                "\$${cartSummary['totalPrice'].toStringAsFixed(2)}",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 14.sp),
              ),
              const Spacer(),
              /// Product Checkout
              Text(
                AppLocalizations.of(context)!.checkout,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 16.sp),
              ),
              HorizontalSpace(context.width * 0.022),
              /// Arrow Icon
              BlocBuilder<LocaleCubit, Locale>(
              builder: (context, locale) {
                  return locale.languageCode == 'en'?SvgPicture.asset(AppAssets.arrowButton):SvgPicture.asset(AppAssets.arrowButtonAr);
                 },
             ),
            ],
          );
        } else {
          return Row(
            children: [
              const Spacer(),
              /// Product Checkout
              Text(
                AppLocalizations.of(context)!.checkout,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 16.sp),
              ),
              HorizontalSpace(context.width * 0.022),
              /// Arrow Icon
              SvgPicture.asset(AppAssets.arrowButton),
            ],
          );
        }
      },
    );
  }
}
