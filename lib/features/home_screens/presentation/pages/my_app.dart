import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/app_routes.dart';
import 'package:mega_top_mobile/core/utils/global_cubit.dart';
import 'package:mega_top_mobile/core/utils/theme/app_theme.dart';
import 'package:mega_top_mobile/features/account_screens/orders_screen/cubit/orders_cubit.dart';
import 'package:mega_top_mobile/features/authentication_screens/data/repo/auth_repo.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/pages/login_screen.dart';
import 'package:mega_top_mobile/features/categories_screens/cubit/category_cubit.dart';
import 'package:mega_top_mobile/features/offers_screens/cubit/offers_cubit.dart';
import 'package:mega_top_mobile/features/on_boarding_screens/presentation/pages/on_boarding_screens.dart';
import 'package:mega_top_mobile/services/shared_preferences/preferences_helper.dart';
import '../../../../core/utils/app_services_dart.dart';
import '../../../../l10n/l10n.dart';
import '../../../authentication_screens/cubit/auth_cubit.dart';
import '../../cubit/home_cubit.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key,});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
        builder: (BuildContext context, Widget? child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<AuthenticationCubit>(
              create:  (BuildContext context) => AuthenticationCubit(AuthRepoImp()),
            ),
            BlocProvider<CategoryCubit>(
              create: (BuildContext context) => CategoryCubit()..getCategories(),
            ),
            BlocProvider<OrdersCubit>(
              create: (BuildContext context) => OrdersCubit(),
            ),
            BlocProvider<GlobalCubit>(
              create: (BuildContext context) => GlobalCubit(),
            ),
            BlocProvider<HomeCubit>(
              create: (BuildContext context) => HomeCubit(),
            ),
            BlocProvider<OffersCubit>(
              create: (BuildContext context) => OffersCubit(),
            ),
          ],
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
                  return LoginScreen();
                } else {
                  return OnBoardingScreens();
                }
              },
            ),
            onGenerateRoute: RouteGenerator.getRoute,
          ),
        );
      },
    );
  }
}
