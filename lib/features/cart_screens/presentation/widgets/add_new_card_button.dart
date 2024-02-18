import 'package:flutter/material.dart';
import '../../../../core/utils/app_string.dart';
import '../../../../core/widgets/primary_empty_button.dart';
import '../../cubit/cart_cubit.dart';

class AddNewCardButton extends StatelessWidget {
  const AddNewCardButton({super.key});

  @override
  Widget build(BuildContext context) {
    CartCubit cartCubit = CartCubit.getCubit(context);
    return PrimaryOutlinedButton(
      text: AppStrings.addNewCardEn,
      onTap: ()=>cartCubit.showAddNewCardBottomSheet(context),
    );
  }
}
