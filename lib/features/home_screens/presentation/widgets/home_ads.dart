import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/ad_card.dart';

class HomeAds extends StatefulWidget {
  HomeAds({super.key});

  @override
  State<HomeAds> createState() => _HomeAdsState();
}

class _HomeAdsState extends State<HomeAds> {
  List<Widget> ads = [AdCard(), AdCard(), AdCard()];
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
      CarouselSlider(
          options: CarouselOptions(
            height: 173,
            autoPlay: true,
            viewportFraction: .95,
            // enlargeCenterPage: true,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            }
          ),
          items: ads),
      Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: ads.asMap().entries.map((entry) {
            return GestureDetector(
                onTap: () => setState(() {
                      _current = entry.key;
                    }),
                child: Container(
                    width: _current == entry.key ? 40: 8.0,
                    height: 8.0,
                    margin: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 4.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                        // shape: BoxShape.circle,
                        color: _current == entry.key
                            ? AppColors.primaryColor
                            : AppColors.greyTextColor)));
          }).toList())
    ]);
  }
}