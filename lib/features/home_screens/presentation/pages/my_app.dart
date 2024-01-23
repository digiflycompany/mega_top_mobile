import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/pages/search_screen.dart';
import '../../../../core/utils/app_fonts.dart';
import '../../../../core/utils/app_services_dart.dart';
import '../../../../l10n/l10n.dart';
import '../../../authentication_screens/cubit/auth_cubit.dart';
import '../../cubit/home_cubit.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationCubit>(
          create: (BuildContext context) => AuthenticationCubit(),
        ),
        BlocProvider<HomeCubit>(
          create: (BuildContext context) => HomeCubit(),
        ),
      ],
      child: GetMaterialApp(
        theme: ThemeData(
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
        //onGenerateRoute:RouteGenerator.getRoute,
        home: const SearchPage(),
      ),
    );
  }
}
