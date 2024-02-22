import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/widgets/remove_item_dialog_title.dart';

class RemoveItemDialog extends StatelessWidget {
  const RemoveItemDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: context.height*0.269,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: const Column(
        children: [
          RemoveItemDialogTitle(),

        ],
      ),
    );
  }
}
