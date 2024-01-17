import 'package:flutter/material.dart';

class NewPasswordPopUp extends StatelessWidget {
  const NewPasswordPopUp({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(4))),
        insetPadding: const EdgeInsets.all(26),
        scrollable: true,
        titlePadding: const EdgeInsets.all(0),
        contentPadding: EdgeInsets.zero,
        content: Container(
            height: 295,
            width: 335,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
            ),
            child: const Text('aaaa')
        ));
  }
}
