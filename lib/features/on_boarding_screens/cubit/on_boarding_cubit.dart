import 'package:flutter_bloc/flutter_bloc.dart';
import 'on_boarding_states.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  OnBoardingCubit() : super(OnBoardingInitial());
  OnBoardingCubit getCubit(context) => BlocProvider.of(context);
}
