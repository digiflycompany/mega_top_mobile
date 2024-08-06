import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/app_routes.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/core/widgets/button_bottom_nav_bar.dart';
import 'package:mega_top_mobile/core/widgets/edit_drop_down_field.dart';
import 'package:mega_top_mobile/core/widgets/edit_text_form_field.dart';
import 'package:mega_top_mobile/core/widgets/primary_button.dart';
import 'package:mega_top_mobile/features/account_screens/address_screen/presentation/cubit/address_cubit.dart';
import 'package:mega_top_mobile/features/account_screens/address_screen/presentation/cubit/address_state.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/primary_app_bar.dart';

class AddNewAddressDetailsScreen extends StatefulWidget {
  const AddNewAddressDetailsScreen({super.key});

  @override
  State<AddNewAddressDetailsScreen> createState() => _AddNewAddressDetailsScreenState();
}

class _AddNewAddressDetailsScreenState extends State<AddNewAddressDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: PreferredSize(
          preferredSize: Size(double.infinity, context.height * 0.089),
          child: const PrimaryAppBar(
            AppStrings.addNewAddress,
            favour: false,
          )),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.width * 0.045,
          vertical: context.height * 0.033,
        ),
        child: SingleChildScrollView(
          child: BlocConsumer<AddressCubit, AddressState>(
            listener: (BuildContext context, AddressState state) {},
            builder: (BuildContext context, AddressState state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const EditTextField(
                    title: AppStrings.address,
                    hintText:AppStrings.addressHint,
                  ),
                  VerticalSpace(40.h),
                  const EditTextField(
                    title: AppStrings.additionalAddressDetails,
                    hintText: AppStrings.additionalAddressDetailsHint,
                  ),
                  VerticalSpace(40.h),
                  EditDropdownField(
                     title: AppStrings.city,
                     items: ['Item 1', 'Item 2', 'Item 3', 'Item 4'],
                    hintText: AppStrings.selectYourCity,
                    onChanged: (value) {
                      print('Selected item: $value');
                    },
                  ),
                  VerticalSpace(40.h),
                  const EditTextField(
                    title: AppStrings.name,
                    hintText: AppStrings.enterYourNameHere,
                  ),
                ],
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: ButtonBottomNavBar(
          button: PrimaryButton(
            content: Text(
              AppStrings.saveAddress,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 16.sp,
              ),
            ),
        onTap: () {
          Routes.editAddressDetailsPageRoute.moveTo;
        },
      )),
    );
  }
}
