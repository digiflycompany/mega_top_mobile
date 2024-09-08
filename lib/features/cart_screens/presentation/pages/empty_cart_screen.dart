import 'package:flutter/material.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/widgets/app_bar_fav_icon.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/widgets/empty_response_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EmptyCartScreen extends StatelessWidget {
  const EmptyCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(double.infinity, context.height * 0.089),
          child: CustomFavouriteAppBar(AppLocalizations.of(context)!.cart)),
      body: EmptyDataPage(
        icon: AppAssets.emptyCartIcon,
        bigFontText: AppLocalizations.of(context)!.yourShippingCartIsEmpty,
        smallFontText: AppLocalizations.of(context)!.browseOurProductsCart,
        buttonText: AppLocalizations.of(context)!.continueShopping,
      ),
    );
  }
}
