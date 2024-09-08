// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// import '../../../../core/utils/app_string.dart';
//
// class ShippingFeesRow extends StatelessWidget {
//   final String? shippingFees;
//   const ShippingFeesRow({
//     super.key,
//     this.shippingFees,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         /// Shipping Fees Text
//         Text(
//           AppStrings.shippingFeesEn,
//           style: TextStyle(
//               color: Colors.black,
//               fontWeight: FontWeight.w500,
//               fontSize: 14.sp),
//         ),
//         const Spacer(),
//
//         /// Shipping Fees
//         Text(
//           shippingFees!,
//           style: TextStyle(
//               color: Colors.black,
//               fontWeight: FontWeight.w500,
//               fontSize: 14.sp),
//         ),
//
//         /// LE
//         Text(
//           AppStrings.leEn,
//           style: TextStyle(
//               color: Colors.black,
//               fontWeight: FontWeight.w500,
//               fontSize: 14.sp),
//         )
//       ],
//     );
//   }
// }
