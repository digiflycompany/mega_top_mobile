// import 'package:flutter/material.dart';
// import 'package:mega_top_mobile/core/utils/app_string.dart';
// import 'package:mega_top_mobile/core/utils/extensions.dart';
// import 'package:mega_top_mobile/core/utils/spacer.dart';
// import 'package:mega_top_mobile/features/account_screens/orders_screen/presentation/widgets/cancel_radio_button.dart';
// import 'package:mega_top_mobile/features/account_screens/orders_screen/presentation/widgets/confirm_cancellation_button.dart';
// import 'package:mega_top_mobile/features/categories_screens/presentation/widgets/bottom_sheet_app_bar.dart';
//
// class CancelBottomSheet extends StatelessWidget {
//   const CancelBottomSheet({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         height: context.height344,
//         color: Colors.white,
//         child: Padding(
//           padding: EdgeInsets.only(bottom: context.height24),
//           child: Column(
//             children: [
//               const BottomSheetAppBar(AppStrings.reasonForCancellation),
//               VerticalSpace(context.height * 0.033),
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: context.width * 0.045),
//                 child: Column(
//                   children: [
//                     const CancelBottomSheetAdaptiveRadioButton(
//                       value: AppStrings.iChangedMyMind,
//                       label: AppStrings.iChangedMyMind,
//                     ),
//                     VerticalSpace(context.height * 0.01),
//                     const CancelBottomSheetAdaptiveRadioButton(
//                       value: AppStrings.itemNoLongerNeeded,
//                       label: AppStrings.itemNoLongerNeeded,
//                     ),
//                     VerticalSpace(context.height * 0.01),
//                     const CancelBottomSheetAdaptiveRadioButton(
//                       value: AppStrings.noReason,
//                       label: AppStrings.noReason,
//                     ),
//                   ],
//                 ),
//               ),
//               Spacer(),
//               ConfirmCancellationButton(),
//             ],
//           ),
//         ));
//   }
// }
