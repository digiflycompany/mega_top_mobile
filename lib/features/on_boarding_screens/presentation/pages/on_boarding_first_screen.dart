import 'package:flutter/material.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/features/on_boarding_screens/presentation/widgets/header_onboarding_1.dart';
import 'package:mega_top_mobile/features/on_boarding_screens/presentation/widgets/onboarding_description.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OnboardingFirstScreen extends StatelessWidget {
  final int index;
  final PageController pageController;
  const OnboardingFirstScreen(
      {super.key, required this.pageController, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
              FirstHeader(pageController: pageController),
              VerticalSpace(context.height * 0.014),
              OnboardingDescription(
                  title: AppLocalizations.of(context)!
                      .exploreOurElectronicProducts,
                  description: AppLocalizations.of(context)!
                      .onboardingFirstScreenDescription)
            ])));
  }
}