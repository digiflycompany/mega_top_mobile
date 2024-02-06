import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';

class ProductMainDescription extends StatelessWidget {
  const ProductMainDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(top:context.height*0.033 ),
      child: const Column(
        children: [
          Row(
            children: [
              Text(
                  AppStrings.upsVersion1En,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    color: Colors.black,
                  ),
              )
            ],
          )
        ],
      ),
    );
  }
}
