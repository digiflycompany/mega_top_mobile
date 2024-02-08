import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_string.dart';
import '../../../home_screens/presentation/widgets/latest_products_list.dart';

class YouMayAlsoLikeColumn extends StatelessWidget {
  const YouMayAlsoLikeColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Align(
          alignment: AlignmentDirectional.topStart,
          child: Text(
            AppStrings.youMayAlsoLikeEn,
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontSize: 16.sp
            ),
          ),
        ),
        const LatestProductsList(),
      ],
    );
  }
}
