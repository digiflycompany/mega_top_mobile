import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/features/on_boarding_screens/cubit/on_boarding_states.dart';

class OnboardingCubit extends Cubit<OnBoardingState> {
  OnboardingCubit() : super(OnBoardingInitial());

  OnboardingCubit getCubit(context) => BlocProvider.of(context);

}
