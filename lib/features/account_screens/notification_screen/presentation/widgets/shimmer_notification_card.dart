import 'package:flutter/material.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/features/account_screens/notification_screen/presentation/widgets/single_notification_shimmer.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerNotificationCard extends StatelessWidget {
  const ShimmerNotificationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Padding(
            padding: EdgeInsets.only(
                top: context.height * 0.016,
                bottom: context.height * 0.016,
                right: context.width * 0.022,
                left: context.width * 0.022),
            child: SingleChildScrollView(
                child: Column(children: [
              const SingleNotificationShimmer(),
              const SingleNotificationShimmer()
            ]))));
  }
}
