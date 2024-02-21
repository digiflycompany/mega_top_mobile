import 'package:flutter/material.dart';

class NotificationCardImage extends StatelessWidget {
  final String photo;
  const NotificationCardImage({super.key, required this.photo});

  @override
  Widget build(BuildContext context) {
    return Image.asset(photo);
  }
}
