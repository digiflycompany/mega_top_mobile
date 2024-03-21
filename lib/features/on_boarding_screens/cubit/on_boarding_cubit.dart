import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/features/on_boarding_screens/cubit/on_boarding_states.dart';

class OnboardingCubit extends Cubit<OnBoardingState> {
  OnboardingCubit() : super(OnBoardingInitial());

  OnboardingCubit getCubit(context) => BlocProvider.of(context);

  late PageController pageController =
      PageController(initialPage: _currentPageIndex);

  int _currentPageIndex = 0;

  void setPageIndex(int index) {
    _currentPageIndex = index;
    emit(OnBoardingPageChanged(index: index));
  }

  int getPageIndex() {
    return _currentPageIndex;
  }
}
