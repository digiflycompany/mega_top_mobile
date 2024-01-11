import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/core/utils/app_fonts.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/pages/login_screen.dart';
import 'package:mega_top_mobile/features/on_boarding_screens/cubit/on_boarding_cubit.dart';

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
      ],
      child: MaterialApp(
        theme: ThemeData(
          fontFamily: FontFamilies.cairo,
        ),
        debugShowCheckedModeBanner: false,
        home: const LoginScreen(),
      ),
    );
  }
}
