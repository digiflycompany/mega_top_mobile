import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mega_top_mobile/features/brands/presentation/widgets/brand_latest_products_list.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/latest_products_list.dart';

class YouMayAlsoLikeColumn extends StatelessWidget {
  const YouMayAlsoLikeColumn({super.key, this.brand});
  final bool? brand;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Align(
          alignment: AlignmentDirectional.topStart,
          child: Text(AppLocalizations.of(context)!.youMayAlsoLike,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 16.sp))),
      brand == true ? BrandLatestProductsList() : LatestProductsList()
    ]);
  }
}