import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:mega_top_mobile/core/widgets/cancel_remove_row.dart';

class RemoveItemDialogBody extends StatelessWidget {
  final String? description;
  const RemoveItemDialogBody({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.width*0.066,vertical: context.height*0.033),
        child: Column(
          children: [
            /// Description
            Text(
              description!,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 16.sp
              ),
            ),
            const Spacer(),
            ///
            const CancelRemoveRow()
          ],
        ),
      ),
    );
  }
}
