import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/features/account_screens/account_details_screen/presentation/widgets/account_option_item.dart';
import 'package:url_launcher/url_launcher.dart';

class CallUsItem extends StatelessWidget {
  const CallUsItem({super.key, this.mainIcon, this.title, this.optionalData});

  final String? mainIcon;
  final String? title;
  final Widget? optionalData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 25.h),
      child: AccountOptionItem(
        onTap: () {
          _launchURL('https://megatop.com.eg/en/contact');
        },
        mainIcon: mainIcon ?? AppAssets.callIcon,
        title: title ?? AppStrings.callUs,
      ),
    );
  }

  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }
}
