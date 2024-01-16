import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:mega_top_mobile/core/utils/app_fonts.dart';
import 'package:mega_top_mobile/features/authentication_screens/cubit/auth_cubit.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/pages/reset_password_screen.dart';
import 'package:mega_top_mobile/features/on_boarding_screens/cubit/on_boarding_cubit.dart';
import 'core/utils/app_services_dart.dart';
import 'l10n/l10n.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
      providers: [
        BlocProvider<OnboardingCubit>(
          create: (BuildContext context) => OnboardingCubit(),
        ),
        BlocProvider<AuthenticationCubit>(
          create: (BuildContext context) => AuthenticationCubit(),
        ),
      ],
      child: GetMaterialApp(
        theme: ThemeData(
          fontFamily: FontFamilies.cairo,
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
        home: const ResetPasswordScreen(),
      ),
    );
  }
}
