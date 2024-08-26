import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/utils/locale/locale_cubit.dart';

import '../utils/app_assets.dart';

class AppBarBackArrow extends StatelessWidget {
  final Function()? onTap;
  final Color? color;

  const AppBarBackArrow({super.key, this.onTap, this.color = Colors.white});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocaleCubit, Locale>(
      builder: (context, locale) {
        return GestureDetector(
          onTap: onTap,
          child: Padding(
            padding: EdgeInsets.only(
                left: context.width * 0.01,
                top: context.height * 0.01,
                bottom: context.height * 0.006),
            child: Container(
              width: context.width * 0.12,
              height: context.height * 0.056,
              decoration: BoxDecoration(
                color: color,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: context.width * 0.022,
                    vertical: context.height * 0.012),
                child: SvgPicture.asset(locale.languageCode == 'en'?AppAssets.backArrowEn:AppAssets.backArrow),
              ),
            ),
          ),
        );
      },
    );
  }
}
