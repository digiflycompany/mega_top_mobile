import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:mega_top_mobile/features/home_screens/cubit/home_states.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_color.dart';
import '../../cubit/home_cubit.dart';

class AdvertisementList extends StatefulWidget {
  const AdvertisementList({super.key});

  @override
  State<AdvertisementList> createState() => _AdvertisementListState();
}

class _AdvertisementListState extends State<AdvertisementList> {
  static const int itemCount = 5;
  int currentIndex = 0;
  late HomeCubit homeCubit;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeCubit = context.read<HomeCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Column(
          children: [
            SizedBox(
              height: context.height * 0.235,
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
                  homeCubit.setImageIndex(currentIndex = index);
                },
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(right: context.width * 0.045),
                    child: Image.asset(
                      AppAssets.addPhoto,
                      width: 275,
                    ),
                  );
                },
              ),
            ),
            DotsIndicator(
              dotsCount: 5,
              position: currentIndex,
              decorator: DotsDecorator(
                size: const Size.square(9.0),
                activeColor: AppColors.primaryColor,
                color: AppColors.dotsColor,
                activeSize: Size(context.width * 0.11, context.height * 0.011),
                activeShape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(context.height * 0.007)),
              ),
            ),
          ],
        );
      },
    );
  }
}
