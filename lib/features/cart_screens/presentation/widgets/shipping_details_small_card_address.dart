import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';

import 'customer_name.dart';

class ShippingDetailsSmallCardAddress extends StatelessWidget {
  final String? customerName;
  final String? address;
  final String? city;
  const ShippingDetailsSmallCardAddress(
      {super.key, this.customerName, this.address, this.city});

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
        Container(
          width: double.infinity, // or specify a fixed width
          child: Text(
            address!,
            overflow: TextOverflow.ellipsis,
            maxLines: 1, // ensure only one line is displayed with ellipsis
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 12.sp),
          ),
        ),
        VerticalSpace(context.height * 0.006),

        /// Phone Number
        Container(
          width: double.infinity, // or specify a fixed width
          child: Row(
            children: [
              Text(
                AppStrings.city2,
                overflow: TextOverflow.ellipsis,
                maxLines: 1, // ensure only one line is displayed with ellipsis
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 12.sp),
              ),
              Text(
                city!,
                overflow: TextOverflow.ellipsis,
                maxLines: 1, // ensure only one line is displayed with ellipsis
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 12.sp),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
