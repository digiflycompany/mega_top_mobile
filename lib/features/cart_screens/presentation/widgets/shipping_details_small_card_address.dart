import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../core/utils/spacer.dart';
import 'delivery_title.dart';

class ShippingDetailsSmallCardAddress extends StatelessWidget {
  final String? deliveryPlace;
  final String? address;
  final String? phone;
  const ShippingDetailsSmallCardAddress({super.key, this.deliveryPlace, this.address, this.phone});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        DeliveryTitle(text: deliveryPlace,fontSize: 14.sp,),
        VerticalSpace(context.height*0.006),
        /// Address
        Text(
          address!,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 12.sp
          ),
        ),
        VerticalSpace(context.height*0.006),
        /// Phone Number
        Text(
          phone!,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 12.sp
          ),
        ),
      ],
    );
  }
}
