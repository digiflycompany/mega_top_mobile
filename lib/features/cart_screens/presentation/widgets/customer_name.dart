import 'package:flutter/material.dart';

class CustomerName extends StatelessWidget {
  final String? text;
  const CustomerName({super.key, this.text,});

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Text(
          text!,
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w700,
          ),
        ),
    );
  }
}
