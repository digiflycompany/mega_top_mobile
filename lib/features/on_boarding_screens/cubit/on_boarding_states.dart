abstract class OnBoardingState {}

class OnBoardingInitial extends OnBoardingState {}

class OnBoardingLoading extends OnBoardingState {}

class OnBoardingSuccess extends OnBoardingState {}

class OnBoardingPageChanged extends OnBoardingState {
  final int index;
  OnBoardingPageChanged({required this.index});
}