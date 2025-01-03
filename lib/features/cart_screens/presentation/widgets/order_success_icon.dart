import 'package:flutter/material.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';

class OrderSuccessIcon extends StatelessWidget {
  final String? img;
  const OrderSuccessIcon({super.key, this.img});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Image.asset(
          img!,
          width: context.width*0.477,
        ));
  }
}
