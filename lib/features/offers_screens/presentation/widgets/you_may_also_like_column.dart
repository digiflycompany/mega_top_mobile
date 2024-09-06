import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/features/offers_screens/presentation/widgets/latest_products_list.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class YouMayAlsoLikeColumn extends StatelessWidget {
  const YouMayAlsoLikeColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: AlignmentDirectional.topStart,
          child: Text(
            AppLocalizations.of(context)!.youMayAlsoLike,
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontSize: 16.sp),
          ),
        ),
        const LatestProductsList(),
      ],
    );
  }
}
