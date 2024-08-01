import 'package:flutter/material.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/core/widgets/app_bar_back_icon.dart';
import 'package:mega_top_mobile/core/widgets/title_app_bar.dart';
import 'package:mega_top_mobile/services/shared_preferences/preferences_helper.dart';
import 'customer_icon.dart';

class PrimaryAppBar extends StatelessWidget {
  const PrimaryAppBar(this.text, {super.key, this.favour = true, this.onTap});

  final String text;
  final bool favour;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: context.height * 0.087,
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: AppColors.shadowAppBarColor,
              offset: Offset(0.0, 4.0),
              blurRadius: 4.0,
            ),
          ],
        ),
        child: Row(
          children: [
            AppBarBackArrow(
              onTap: () {
                if (onTap != null) {
                  onTap!();
                } else {
                  Navigator.pop(context);
                }
              },
            ),
            HorizontalSpace(context.width * 0.022),
            Padding(
              padding: EdgeInsets.only(top: context.height * 0.008),
              child: TitleText(text: text),
            ),
            const Spacer(),
            FutureBuilder<String?>(
              future: PreferencesHelper.getToken(),
              builder: (context, snapshot) {
                final token = snapshot.data;
                final isUserLoggedIn = token != null;
                if (isUserLoggedIn && favour) {
                  return Padding(
                    padding: EdgeInsets.only(right: context.width * 0.045),
                    child: const CustomerIcon(
                      icon: AppAssets.favouritesIcon,
                      number: AppStrings.zero,
                    ),
                  );
                } else {
                  return Container();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
