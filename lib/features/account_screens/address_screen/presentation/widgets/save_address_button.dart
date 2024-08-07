import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/app_routes.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/widgets/button_bottom_nav_bar.dart';
import 'package:mega_top_mobile/core/widgets/button_circular_progress.dart';
import 'package:mega_top_mobile/core/widgets/primary_button.dart';
import 'package:mega_top_mobile/features/account_screens/address_screen/presentation/cubit/address_cubit.dart';
import 'package:mega_top_mobile/features/account_screens/address_screen/presentation/cubit/address_state.dart';

class SaveAddressButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  const SaveAddressButton({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddressCubit, AddressState>(
      listener: (context, state){
        if(state is AddNewAddressSuccess){
          context.read<AddressCubit>().savedSuccessToast(context, AppStrings.savedSuccessfully);
          Future.delayed(Duration(seconds: 1), () {
            Routes.shippingAddressPageRoute.moveTo;
          });
        }
      },
      builder: (context, state) {
        AddressCubit cubit = context.read<AddressCubit>();
        return ButtonBottomNavBar(
            button: PrimaryButton(
              content: state is AddNewAddressLoading?const ButtonCircularProgress():Text(
                AppStrings.saveAddress,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 16.sp,
                ),
              ),
              onTap: () {
                if(formKey.currentState!.validate()){
                  cubit.addNewAddress(
                      cubit.nameController.text,
                      cubit.addressController.text,
                      cubit.addressDetailsController.text,
                      cubit.city
                  );
                }
              },
            ));
      },
    );
  }
}
