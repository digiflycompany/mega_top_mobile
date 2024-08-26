import 'package:flutter/material.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/widgets/empty_response_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NoInternetScreen extends StatelessWidget {
  final Function() buttonOnTap;
  const NoInternetScreen({super.key, required this.buttonOnTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top:context.height40),
      child: EmptyDataPage(
          icon: AppAssets.noInternetIcon,
          bigFontText: AppLocalizations.of(context)!.sorryThereIsNoInternet,
          smallFontText: AppLocalizations.of(context)!.pleaseCheckYourInternetConnection,
          buttonText: AppLocalizations.of(context)!.retryToConnect,
          buttonOnTap: buttonOnTap,
      ),
    );
  }
}
