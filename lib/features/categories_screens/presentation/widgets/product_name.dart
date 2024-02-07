import 'package:flutter/material.dart';

class ProductNameText extends StatelessWidget {
  final String? name;
  const ProductNameText({super.key, this.name});

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
