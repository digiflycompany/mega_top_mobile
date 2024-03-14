import 'package:flutter/material.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/core/widgets/title_app_bar.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/app_string.dart';
import '../../../../core/widgets/app_bar_back_icon.dart';
import 'customer_icon.dart';

class PrimaryAppBar extends StatelessWidget {
  const PrimaryAppBar(this.text, {super.key, this.favour = true});
  final String text;
  final bool favour;

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
                Navigator.pop(context);
              },
            ),
            HorizontalSpace(context.width * 0.022),
            Padding(
              padding: EdgeInsets.only(top: context.height * 0.008),
              child: TitleText(text: text),
            ),
            const Spacer(),
            favour
                ? Padding(
                    padding: EdgeInsets.only(right: context.width * 0.045),
                    child: const CustomerIcon(
                      icon: AppAssets.favouritesIcon,
                      number: AppStrings.twelve,
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
