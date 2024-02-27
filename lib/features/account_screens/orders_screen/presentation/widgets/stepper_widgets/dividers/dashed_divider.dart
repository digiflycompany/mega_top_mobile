import 'package:flutter/material.dart';

class DashedDivider extends StatelessWidget {
  final double width;
  final Color color;
  final double dashHeight;
  final double dashSpace;

  const DashedDivider({
    Key? key,
    this.width = 2,
    this.color = Colors.black,
    this.dashHeight = 6,
    this.dashSpace = 3,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final dashCount =
            (constraints.maxHeight / (dashHeight + dashSpace)).floor();
        return Flex(
          direction: Axis.vertical,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List<Widget>.generate(dashCount, (_) {
            return SizedBox(
              width: width,
              height: dashHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(color: color),
              ),
            );
          }),
        );
      },
    );
  }
}
