// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:mega_top_mobile/core/utils/extensions.dart';
// import 'package:mega_top_mobile/core/utils/spacer.dart';
//
// import '../../../../core/utils/app_color.dart';
// import '../../../../core/utils/app_string.dart';
//
// class CvvTextField extends StatelessWidget {
//   const CvvTextField({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           /// Expiration Date TextField
//           Text(
//             AppStrings.cVVEn,
//             style: TextStyle(
//                 color: Colors.black,
//                 fontWeight: FontWeight.w600,
//                 fontSize: 14.sp),
//           ),
//           VerticalSpace(context.height * 0.012),
//
//           /// Text Field
//           SizedBox(
//             height: context.height * 0.065,
//             width: double.infinity,
//             child: TextFormField(
//               cursorColor: AppColors.blackGreyColor,
//               cursorHeight: context.width * 0.046,
//               decoration: InputDecoration(
//                 hintText: AppStrings.securityCodeEn,
//                 hintStyle: TextStyle(
//                   color: AppColors.greyTextColor,
//                   fontWeight: FontWeight.w500,
//                   fontSize: 14.sp,
//                 ),
//                 enabledBorder: UnderlineInputBorder(
//                   borderSide: BorderSide(
//                       width: 1.w, color: AppColors.googleButtonBorder),
//                 ),
//                 focusedBorder: UnderlineInputBorder(
//                   borderSide:
//                       BorderSide(width: 1.w, color: AppColors.blackGreyColor),
//                 ),
//                 contentPadding: EdgeInsets.only(bottom: context.height * 0.012),
//               ),
//               keyboardType: TextInputType.number,
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
