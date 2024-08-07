import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import '../../../../core/utils/spacer.dart';
import 'customer_name.dart';

class ShippingDetailsSmallCardAddress extends StatelessWidget {
  final String? customerName;
  final String? address;
  final String? phone;
  const ShippingDetailsSmallCardAddress(
      {super.key, this.customerName, this.address, this.phone});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CustomerName(
          text: customerName,
        ),
        VerticalSpace(context.height * 0.006),

        /// Address
        Text(
          address!,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 12.sp),
        ),
        VerticalSpace(context.height * 0.006),

        /// Phone Number
        Text(
          phone!,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 12.sp),
        ),
      ],
    );
  }
}
