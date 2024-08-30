import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/features/account_screens/profile_screen/presentation/cubit/account_details_cubit.dart';
import 'package:mega_top_mobile/features/account_screens/profile_screen/presentation/widgets/edit_profile_screen_widgets/edit_profile_details_fields.dart';
import 'package:mega_top_mobile/features/account_screens/profile_screen/presentation/widgets/edit_profile_screen_widgets/update_user_details_button.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/primary_app_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
        child: PrimaryAppBar(
          AppLocalizations.of(context)!.profileDetails,
          favour: false,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.width * 0.066),
        child: const SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: EditProfileDetailsFields(),
        ),
      ),
      bottomNavigationBar: const UpdateUserDetailsButton(),
    );
  }
}
