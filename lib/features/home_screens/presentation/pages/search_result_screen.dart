import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/core/widgets/no_internet_page.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/widgets/empty_response_page.dart';
import 'package:mega_top_mobile/features/home_screens/cubit/home_cubit.dart';
import 'package:mega_top_mobile/features/home_screens/cubit/home_states.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/no_result_column.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/search_result_list.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/search_result_text.dart';
import '../../../../core/utils/app_string.dart';
import '../widgets/primary_app_bar.dart';

class SearchResultPage extends StatefulWidget {
  const SearchResultPage({super.key});

  @override
  State<SearchResultPage> createState() => _SearchResultPageState();
}

final controller = ScrollController();
late HomeCubit cubit;

class _SearchResultPageState extends State<SearchResultPage> {
  @override
  void initState() {
    cubit = context.read<HomeCubit>();
    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.offset) {
        cubit.hasMoreProducts = true;
        cubit.page++;
        cubit.getMoreProduct().then((value) {
          if (cubit.hasMoreProducts == true) {
            cubit.selectOption(AppStrings.defaultEn);
          }
          cubit.hasMoreProducts = null;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final HomeCubit homeCubit = context.read<HomeCubit>();
    return Scaffold(
        backgroundColor: AppColors.circleAvatarBackground,
        appBar: PreferredSize(
            preferredSize: Size(double.infinity, context.height * 0.089),
            child: PrimaryAppBar(homeCubit.searchWord.text)),
        body: BlocConsumer<HomeCubit, HomeState>(
          listener: (BuildContext context, HomeState state) {
            if (state is SearchMoreProductsNoInternetConnection) {
              context.read<HomeCubit>().page--;
              Fluttertoast.showToast(msg: AppStrings.pleaseCheckYourInternet);
            }
          },
          builder: (BuildContext context, HomeState state) {
            if (state is SearchNoInternetConnection) {
              return NoInternetScreen(buttonOnTap: () {
                if(homeCubit.searchWord.text.isNotNullOrEmpty)
                {
                  homeCubit.search();
                }
              });
            } else if (homeCubit.searchModel.isNull) {
              return Center(child: CircularProgressIndicator());
            } else if (homeCubit.searchModel!.data!.products.length > 0) {
              return Column(
                children: [
                  VerticalSpace(context.height * 0.028),
                  SearchResultCount(
                    searchCount:
                        homeCubit.searchModel!.data!.products.length.toString(),
                  ),
                  VerticalSpace(context.height * 0.028),
                  SearchResultList(
                    controller: controller,
                  ),
                ],
              );
            } else if (homeCubit.searchModel!.data!.products.length == 0) {
              return EmptyDataPage(
                icon: AppAssets.emptyNotificationsIcon,
                bigFontText: AppStrings.noProductsEn,
                smallFontText: AppStrings.noProductListItemsEn,
              );
            } else {
              return SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    NoResultColumn(),
                  ],
                ),
              );
            }
          },
        ));
  }

  @override
  void dispose() {
    cubit.searchModel = null;
    cubit.selectOption(AppStrings.defaultEn);
    cubit.page = 1;
    cubit.minPriceController.clear();
    cubit.maxPriceController.clear();
    cubit.minPrice = null;
    cubit.maxPrice = null;
    super.dispose();
  }
}
