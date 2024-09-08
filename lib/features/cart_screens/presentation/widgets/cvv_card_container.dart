// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:mega_top_mobile/core/utils/extensions.dart';
// import 'package:mega_top_mobile/core/utils/spacer.dart';
//
//
// class CvvCardContainer extends StatelessWidget {
//   final String? cardIcon;
//   final String? cardNumber;
//   const CvvCardContainer({super.key, this.cardIcon, this.cardNumber});
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.only(bottom: context.height * 0.039),
//       child: Row(
//         children: [
//           Image.asset(
//             cardIcon!,
//             width: context.width * 0.066,
//           ),
//           HorizontalSpace(context.width * 0.022),
//           Text(
//             cardNumber!,
//             style: TextStyle(
//                 color: Colors.black,
//                 fontWeight: FontWeight.w600,
//                 fontSize: 14.sp),
//           ),
//           const Spacer(),
//           const CvvOutlinedTextField()
//         ],
//       ),
//     );
//   }
// }
