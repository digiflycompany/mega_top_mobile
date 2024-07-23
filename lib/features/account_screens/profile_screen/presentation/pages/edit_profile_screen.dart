import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/widgets/button_bottom_nav_bar.dart';
import 'package:mega_top_mobile/core/widgets/primary_button.dart';
import 'package:mega_top_mobile/features/account_screens/profile_screen/presentation/cubit/account_details_cubit.dart';
import 'package:mega_top_mobile/features/account_screens/profile_screen/presentation/widgets/edit_profile_details_fields.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/primary_app_bar.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late AccountDetailsCubit accountDetailsCubit;

  @override
  void initState() {
    super.initState();
    accountDetailsCubit = context.read<AccountDetailsCubit>();
    accountDetailsCubit.getAccountDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, context.height * 0.089),
        child: const PrimaryAppBar(
          AppStrings.profileDetails,
          favour: false,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.width * 0.066),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: EditProfileDetailsFields(),
        ),
      ),
      bottomNavigationBar: ButtonBottomNavBar(
        button: PrimaryButton(
          text: AppStrings.save,
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
