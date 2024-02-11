import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/features/categories_screens/cubit/category_cubit.dart';
import '../../../../core/utils/app_fonts.dart';
import '../../../../core/utils/app_routes.dart';
import '../../../../core/utils/app_services_dart.dart';
import '../../../../l10n/l10n.dart';
import '../../../authentication_screens/cubit/auth_cubit.dart';
import '../../cubit/home_cubit.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(context.width, context.height), // Your design size
      builder: (BuildContext context, Widget? child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<AuthenticationCubit>(
              create: (BuildContext context) => AuthenticationCubit(),
            ),
            BlocProvider<HomeCubit>(
              create: (BuildContext context) => HomeCubit(),
            ),
            BlocProvider<CategoryCubit>(
              create: (BuildContext context) => CategoryCubit(),
            ),
          ],
          child: GetMaterialApp(
            theme: ThemeData(
              scaffoldBackgroundColor: Colors.white,
              fontFamily: FontFamilies.cairo,
              splashColor: Colors.transparent,
            ),
            debugShowCheckedModeBanner: false,
            supportedLocales: L10n.all,
            locale: const Locale('en'),
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            navigatorKey: AppService().navigatorKey,
            onGenerateRoute: RouteGenerator.getRoute,
            //home: const SignUpOrLoginPage(),
          ),
        );
      },
    );
  }
}