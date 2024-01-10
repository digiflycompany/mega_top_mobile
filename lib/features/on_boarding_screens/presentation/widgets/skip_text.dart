import 'package:flutter/cupertino.dart';
import 'package:mega_top_mobile/core/utils/media_query.dart';
import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/app_string.dart';

class SkipText extends StatelessWidget {
  final Function()? onTap;
  const SkipText({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: Padding(
        padding:  EdgeInsets.only(top: context.height*0.08,left: context.width*0.045),
        child: const Row(
          children: [
            Text(
              AppStrings.skip,
              style: TextStyle(
                color: AppColors.primaryColor,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
