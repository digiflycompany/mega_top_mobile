import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/utils/global_cubit_state.dart';

class AuthenticationCubit extends Cubit<CubitBaseState> {
  AuthenticationCubit() : super( CubitBaseState.initial);

  AuthenticationCubit getCubit(context) => BlocProvider.of(context);

  bool isPasswordVisible = true;

  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    emit(CubitBaseState.initial);
  }

}

