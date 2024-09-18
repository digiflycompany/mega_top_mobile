import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/services/shared_preferences/preferences_helper.dart';
import 'package:mega_top_mobile/core/widgets/button_bottom_nav_bar.dart';
import 'package:mega_top_mobile/core/widgets/button_circular_progress.dart';
import 'package:mega_top_mobile/core/widgets/primary_button.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/cubit/cart_cubit.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/cubit/cart_states.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ConfirmOrderButton extends StatelessWidget {
  const ConfirmOrderButton({super.key});

  @override
  Widget build(BuildContext context) {
    final email = PreferencesHelper.getEmail.toString();
    final name = PreferencesHelper.getName();
    final phone = PreferencesHelper.getPhone;
    final addressId = PreferencesHelper.getSelectedAddress()['id'].toString();
    return BlocConsumer<CartCubit, CartState>(
      listener: (context,state)=>context.read<CartCubit>().handleCheckoutStates(context, state),
      builder: (context, state) {
        return ButtonBottomNavBar(
          button: PrimaryButton(
            content: state is CheckoutLoading?const ButtonCircularProgress():Text(
              AppLocalizations.of(context)!.confirmOrder,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 16.sp,
              ),
            ),
            onTap: state is CheckoutLoading?(){}:(){
               context.read<CartCubit>().checkout(addressId, name, phone, email);
            },
          ),
        );
      },
    );
  }
}
