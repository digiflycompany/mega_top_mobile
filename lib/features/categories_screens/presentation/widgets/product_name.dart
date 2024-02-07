import 'package:flutter/material.dart';

class ProductDetailedNameText extends StatelessWidget {
  final String? name;
  const ProductDetailedNameText({super.key, this.name});

  @override
  Widget build(BuildContext context) {
    return  Text(
      name!,
      style: const TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 18,
        color: Colors.black,
      ),
    );
  }
}
