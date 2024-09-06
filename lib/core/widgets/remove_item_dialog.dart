import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/widgets/remove_item_dialog_body.dart';
import 'package:mega_top_mobile/core/widgets/remove_item_dialog_title.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RemoveItemDialog extends StatelessWidget {
  final Function() onTap;
  const RemoveItemDialog({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: context.height*0.28,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: Column(
        children: [
          const RemoveItemDialogTitle(),
          RemoveItemDialogBody(description: AppLocalizations.of(context)!.areYouSureYouWantToRemoveThisAddress,onTap: onTap,),
        ],
      ),
    );
  }
}
