import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/app_routes.dart';
import 'package:mega_top_mobile/core/utils/app_services_dart.dart';
import 'package:mega_top_mobile/core/utils/global_cubit.dart';
import 'package:mega_top_mobile/core/utils/theme/app_theme.dart';
import 'package:mega_top_mobile/features/account_screens/orders_screen/cubit/orders_cubit.dart';
import 'package:mega_top_mobile/features/categories_screens/cubit/category_cubit.dart';
import 'package:mega_top_mobile/features/home_screens/cubit/home_cubit.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/pages/home_page_screen.dart';
import 'package:mega_top_mobile/features/offers_screens/cubit/offers_cubit.dart';
import 'package:mega_top_mobile/features/on_boarding_screens/presentation/pages/on_boarding_screens.dart';
import 'package:mega_top_mobile/l10n/l10n.dart';
import 'package:mega_top_mobile/services/shared_preferences/preferences_helper.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
            BlocProvider<OrdersCubit>(
              create: (BuildContext context) => OrdersCubit(),
            ),
            BlocProvider<GlobalCubit>(
              create: (BuildContext context) => GlobalCubit(),
            ),
            BlocProvider<HomeCubit>(
              create: (BuildContext context) => HomeCubit(),
             // create: (BuildContext context) => HomeCubit()..getLastOffers(),
            ),
            BlocProvider<OffersCubit>(
              create: (BuildContext context) => OffersCubit(),
            ),
          ],
          child: GestureDetector(
            onTap: () {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            child: MaterialApp(
              theme: AppTheme.lightTheme,
              debugShowCheckedModeBanner: false,
              supportedLocales: L10n.all,
              locale: const Locale('en'),
              localizationsDelegates: const [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              navigatorKey: AppService().navigatorKey,
              home: FutureBuilder<bool>(
                future: PreferencesHelper.hasSeenOnboarding(),
                builder: (context, snapshot) {
                  if (snapshot.data == true) {
                    return HomePage();
                  } else {
                    return OnBoardingScreens();
                  }
                },
              ),
              onGenerateRoute: RouteGenerator.getRoute,
            ),
          ),
        );
      },
    );
  }
}
