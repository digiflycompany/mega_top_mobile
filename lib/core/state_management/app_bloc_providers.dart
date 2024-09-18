import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/core/utils/global_cubit.dart';
import 'package:mega_top_mobile/core/utils/global_repo.dart';
import 'package:mega_top_mobile/core/utils/locale/locale_cubit.dart';
import 'package:mega_top_mobile/features/account_screens/account_details_screen/presentation/cubit/compare_click_cubit.dart';
import 'package:mega_top_mobile/features/account_screens/profile_screen/data/repositories/account_details_repo.dart';
import 'package:mega_top_mobile/features/account_screens/profile_screen/presentation/cubit/account_details_cubit.dart';
import 'package:mega_top_mobile/features/categories_screens/cubit/category_cubit.dart';
import 'package:mega_top_mobile/features/home_screens/cubit/ad_details_cubit.dart';
import 'package:mega_top_mobile/features/home_screens/cubit/home_ads_cubit.dart';
import 'package:mega_top_mobile/features/home_screens/cubit/home_cubit.dart';
import 'package:mega_top_mobile/features/home_screens/cubit/latest_offers_cubit.dart';
import 'package:mega_top_mobile/features/home_screens/cubit/latest_products_cubit.dart';
import 'package:mega_top_mobile/features/home_screens/data/repo/home_page_repo.dart';
import 'package:mega_top_mobile/features/offers_screens/cubit/offers_cubit.dart';

List<BlocProvider> appBlocProviders = [
  BlocProvider<CategoryCubit>(
      create: (BuildContext context) => CategoryCubit()..getCategories()),
  BlocProvider<LatestOffersCubit>(
      create: (BuildContext context) =>
          LatestOffersCubit(GlobalRepoImp())..getLatestOffers()),
  BlocProvider<LatestProductsCubit>(
      create: (BuildContext context) =>
          LatestProductsCubit(GlobalRepoImp())..getLatestProducts()),
  BlocProvider<AccountDetailsCubit>(
      create: (BuildContext context) =>
          AccountDetailsCubit(AccountDetailsRepoImp())),
  BlocProvider<HomeCubit>(create: (BuildContext context) => HomeCubit()),
  BlocProvider<OffersCubit>(
      create: (BuildContext context) => OffersCubit()..getOffers()),
  BlocProvider<LocaleCubit>(create: (BuildContext context) => LocaleCubit()),
  BlocProvider<CompareClickCubit>(create: (context) => CompareClickCubit()),
  BlocProvider<GlobalCubit>(create: (context) => GlobalCubit(GlobalRepoImp())),
  BlocProvider<AdDetailsCubit>(
      create: (context) => AdDetailsCubit(HomeRepoImp())),
  BlocProvider<HomeAdsCubit>(
      create: (context) => HomeAdsCubit(HomeRepoImp())..fetchAds())
];