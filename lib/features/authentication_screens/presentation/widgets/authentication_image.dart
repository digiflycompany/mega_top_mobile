import 'package:flutter/cupertino.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';

import '../../../../core/utils/app_assets.dart';

class AuthenticationLogo extends StatelessWidget {
  const AuthenticationLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppAssets.megaTopLogo,
      width: context.width * 0.35,
    );
  }
}
