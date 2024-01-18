import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_color.dart';

class AdvertisementList extends StatefulWidget {

  const AdvertisementList({super.key});
  @override
  State<AdvertisementList> createState() => _AdvertisementListState();
}

class _AdvertisementListState extends State<AdvertisementList> {
  final int itemCount = 5;
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: context.height*0.235,
          child: PageView.builder(
            padEnds: false,
            controller: PageController(
              viewportFraction: 0.89,
              initialPage: 0,
            ),
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: itemCount,
            onPageChanged: (int index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return Padding(
                padding:  EdgeInsets.only(right: context.width*0.045),
                child: Image.asset(AppAssets.addPhoto,width: 275,),
              );
            },
          ),
        ),
        DotsIndicator(
          dotsCount: 5,
          position: _currentIndex,
          decorator: DotsDecorator(
            size: const Size.square(9.0),
            activeColor: AppColors.primaryColor,
            color: AppColors.dotsColor,
            activeSize:  Size(context.width*0.11, context.height*0.011),
            activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(context.height*0.007)),
          ),
        ),
      ],
    );
  }
}