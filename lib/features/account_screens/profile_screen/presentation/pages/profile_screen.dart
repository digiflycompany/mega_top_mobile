import 'package:flutter/material.dart';
import 'package:mega_top_mobile/core/utils/app_routes.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/features/account_screens/profile_screen/presentation/widgets/edit_password_item.dart';
import 'package:mega_top_mobile/features/account_screens/profile_screen/presentation/widgets/profile_screen_widgets/delete_account_item.dart';
import 'package:mega_top_mobile/features/account_screens/profile_screen/presentation/widgets/profile_screen_widgets/edit_profile_item.dart';
import 'package:mega_top_mobile/features/account_screens/profile_screen/presentation/widgets/profile_screen_widgets/profile_screen_header.dart';
import 'package:mega_top_mobile/features/account_screens/profile_screen/presentation/widgets/profile_screen_widgets/profile_screen_logo.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/primary_app_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size(double.infinity, context.height * 0.089),
            child: PrimaryAppBar(
              AppLocalizations.of(context)!.profile,
              favour: false,
            )),
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: context.width * 0.045),
            child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const ProfileScreenLogo(),
                      const ProfileScreenHeader(),
                      EditProfileItem(
                          onTap: () => Routes.profileDetailsPageRoute.moveTo),
                      EditPasswordItem(
                          onTap: () => Routes.passwordDetailsPageRoute.moveTo),
                      DeleteAccountItem()
                    ]))));
  }
}
