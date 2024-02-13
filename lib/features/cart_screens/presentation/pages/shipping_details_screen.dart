import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/utils/app_string.dart';
import '../../../home_screens/presentation/widgets/primary_app_bar.dart';

class ShippingDetailsPage extends StatelessWidget {
  const ShippingDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(double.infinity, context.height*0.089),
          child: const PrimaryAppBar(
              AppStrings.shippingDetailsEn,
              favour: false,
          )),
    );
  }
}
