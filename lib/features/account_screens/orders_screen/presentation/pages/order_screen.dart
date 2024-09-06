import 'package:flutter/material.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/features/account_screens/orders_screen/presentation/widgets/orders_list.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/primary_app_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, context.height * 0.089),
        child: PrimaryAppBar(
          AppLocalizations.of(context)!.orders,
          favour: false,
        ),
      ),
      body: OrdersList(),
    );
  }
}
