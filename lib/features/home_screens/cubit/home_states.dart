abstract class HomeState {}

class HomeInitial extends HomeState {}

class ImageChanged extends HomeState {
  final int index;
  ImageChanged({required this.index});
}
class HomePageChanged extends HomeState {
  final int index;
  HomePageChanged({required this.index});
}

class UserDetailsSuccess extends HomeState {}

class UserDetailsLoading extends HomeState {}

class UserDetailsFailure extends HomeState {
  final String error;

  UserDetailsFailure(this.error);
}
