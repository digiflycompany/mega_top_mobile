import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/features/categories_screens/presentation/widgets/white_box_icon.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/spacer.dart';
import '../../../../core/widgets/custom_animated_toast.dart';

class FavourCompareColumn extends StatelessWidget {
  const FavourCompareColumn({super.key});

  void _showOverlay(BuildContext context) {
    OverlayEntry? overlayEntry;
    overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: kToolbarHeight + MediaQuery.of(context).padding.top,
        width: MediaQuery.of(context).size.width,
        child: AnimatedOverlayToast(
          message: 'The product added to wish list',
          color: AppColors.primaryGreenColor,
          onDismissed: () {
            if (overlayEntry != null) {
              overlayEntry!.remove();
              overlayEntry = null; // Clear the reference if needed
            }
          },
        ),
      ),
    );
    Overlay.of(context)?.insert(overlayEntry!);
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.topEnd,
      child: Padding(
        padding: EdgeInsets.only(right: context.width * 0.045, top: context.height * 0.010),
        child: Column(
          children: [
            WhiteBoxIcon(
              icon: AppAssets.favourOutlinedIcon,
              onTap: () => _showOverlay(context),
            ),
            VerticalSpace(context.height * 0.012),
            WhiteBoxIcon(
              icon: AppAssets.compareIcon,
              onTap: () {}, // Define the onTap action for the compare icon if needed
            ),
          ],
        ),
      ),
    );
  }
}