import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/features/account_screens/orders_screen/cubit/orders_details_cubit.dart';
import 'package:mega_top_mobile/features/account_screens/orders_screen/presentation/widgets/stepper_widgets/custom_stepper.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/primary_app_bar.dart';

class OrdersDetailsScreen extends StatelessWidget {
  const OrdersDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(double.infinity, context.height * 0.089),
          child: const PrimaryAppBar(
            AppStrings.profileDetails,
            favour: false,
          )),
      body: BlocProvider<OrdersDetailsCubit>(
        create: (BuildContext context) => OrdersDetailsCubit(),
        child: const Column(
          children: [CustomStepper()],
        ),
      ),
    );
  }
}
