import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/widgets/button_bottom_nav_bar.dart';
import 'package:mega_top_mobile/core/widgets/button_circular_progress.dart';
import 'package:mega_top_mobile/core/widgets/primary_button.dart';
import 'package:mega_top_mobile/features/account_screens/address_screen/presentation/cubit/address_cubit.dart';
import 'package:mega_top_mobile/features/account_screens/address_screen/presentation/cubit/address_state.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EditAddressButton extends StatelessWidget {
  final String addressID;
  const EditAddressButton({super.key, required this.addressID});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddressCubit, AddressState>(
      listener: (context, state)=>context.read<AddressCubit>().handleUpdateAddressState(context,state),
      builder: (context, state) {
        AddressCubit cubit = context.read<AddressCubit>();
        return ButtonBottomNavBar(
          button: PrimaryButton(
            content: state is EditAddressLoading?const ButtonCircularProgress():Text(
              AppLocalizations.of(context)!.editAddress,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 16.sp,
              ),
            ),
            onTap: state is EditAddressLoading?(){}:(){
              context.read<AddressCubit>().updateAddress(
                  addressID,
                  cubit.nameController.text,
                  cubit.addressController.text,
                  cubit.addressDetailsController.text,
                  cubit.city,
              );
            },
          ),
        );
      },
    );
  }
}
