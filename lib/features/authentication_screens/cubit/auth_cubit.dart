import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/features/authentication_screens/cubit/auth_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit() : super(AuthenticationInitial());

  AuthenticationCubit getCubit(context) => BlocProvider.of(context);

  bool isPasswordVisible = true;

  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    emit(AuthenticationInitial());
  }

  void passwordChangedSuccessfully(BuildContext context){
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(4))),
            insetPadding: const EdgeInsets.all(26),
            scrollable: true,
            titlePadding: const EdgeInsets.all(0),
            contentPadding: EdgeInsets.zero,
            content: Container(
                height: 295,
                width: 335,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Text('aaaa')
            ));
      },
    );
  }
}

