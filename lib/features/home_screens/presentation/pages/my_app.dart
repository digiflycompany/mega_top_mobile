import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/app_routes.dart';
import 'package:mega_top_mobile/core/utils/app_services_dart.dart';
import 'package:mega_top_mobile/core/utils/global_cubit.dart';
import 'package:mega_top_mobile/core/utils/global_repo.dart';
import 'package:mega_top_mobile/core/utils/locale/locale_cubit.dart';
import 'package:mega_top_mobile/core/utils/theme/app_theme.dart';
import 'package:mega_top_mobile/features/account_screens/account_details_screen/presentation/cubit/compare_click_cubit.dart';
import 'package:mega_top_mobile/features/account_screens/profile_screen/data/repositories/account_details_repo.dart';
import 'package:mega_top_mobile/features/account_screens/profile_screen/presentation/cubit/account_details_cubit.dart';
import 'package:mega_top_mobile/features/categories_screens/cubit/category_cubit.dart';
import 'package:mega_top_mobile/features/home_screens/cubit/home_cubit.dart';
import 'package:mega_top_mobile/features/home_screens/cubit/latest_offers_cubit.dart';
import 'package:mega_top_mobile/features/home_screens/cubit/latest_products_cubit.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/pages/home_page_screen.dart';
import 'package:mega_top_mobile/features/offers_screens/cubit/offers_cubit.dart';
import 'package:mega_top_mobile/features/on_boarding_screens/presentation/pages/on_boarding_screens.dart';
import 'package:mega_top_mobile/l10n/l10n.dart';
import 'package:mega_top_mobile/services/shared_preferences/preferences_helper.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final globalRepo = GlobalRepoImp();
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<CategoryCubit>(
              create: (BuildContext context) =>
                  CategoryCubit()..getCategories(),
            ),
            BlocProvider<LatestOffersCubit>(
              create: (BuildContext context) =>
                  LatestOffersCubit(GlobalRepoImp())..getLatestOffers(),
            ),
            BlocProvider<LatestProductsCubit>(
              create: (BuildContext context) =>
                  LatestProductsCubit(GlobalRepoImp())..getLatestProducts(),
            ),
            BlocProvider<AccountDetailsCubit>(
              create: (BuildContext context) =>
                  AccountDetailsCubit(AccountDetailsRepoImp()),
            ),
            BlocProvider<HomeCubit>(
              create: (BuildContext context) => HomeCubit(),
            ),
            BlocProvider<OffersCubit>(
              create: (BuildContext context) => OffersCubit()..getOffers(),
            ),
            BlocProvider<LocaleCubit>(
                create: (BuildContext context) => LocaleCubit()),
            BlocProvider<CompareClickCubit>(
                create: (context) => CompareClickCubit()),
            BlocProvider<GlobalCubit>(create: (context) => GlobalCubit(globalRepo))
          ],
          child: GestureDetector(
            onTap: () {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            child: BlocBuilder<LocaleCubit, Locale>(
              builder: (context, locale) {
                return MaterialApp(
                  theme: AppTheme.lightTheme,
                  debugShowCheckedModeBanner: false,
                  supportedLocales: L10n.all,
                  locale: locale,
                  localizationsDelegates: const [
                    AppLocalizations.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  navigatorKey: AppService().navigatorKey,
                  builder: DevicePreview.appBuilder,
                  home: FutureBuilder<bool>(
                    future: PreferencesHelper.hasSeenOnboarding(),
                    builder: (context, snapshot) {
                      if (snapshot.data == true) {
                        return HomePage();
                      } else {
                        return OnBoardingScreens();
                      }
                    }
                  ),
                  onGenerateRoute: RouteGenerator.getRoute
                );
              }
            )
          )
        );
      }
    );
  }
}
