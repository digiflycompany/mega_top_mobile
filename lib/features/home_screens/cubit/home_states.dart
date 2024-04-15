import 'package:mega_top_mobile/features/authentication_screens/data/models/login_model.dart';

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

class HomeLoadedState extends HomeState {
  final UserModel user;

  HomeLoadedState(this.user);
}

class UserDetailsSuccess extends HomeState {}

class UserDetailsLoading extends HomeState {}

class UserDetailsFailure extends HomeState {
  final String error;

  UserDetailsFailure(this.error);
}

class LatestOfferSuccess extends HomeState {}

class LatestOfferLoading extends HomeState {}

class LatestOfferFailure extends HomeState {
  final String error;

  LatestOfferFailure(this.error);
}
