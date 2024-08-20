import 'package:mega_top_mobile/features/authentication_screens/data/models/user_model.dart';

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

class LatestProductSuccess extends HomeState {}

class LatestProductLoading extends HomeState {}

class LatestProductFailure extends HomeState {
  final String error;

  LatestProductFailure(this.error);
}

class LatestOfferSuccess extends HomeState {}

class LatestOfferLoading extends HomeState {}

class LatestOfferFailure extends HomeState {
  final String error;

  LatestOfferFailure(this.error);
}

class SearchSuccess extends HomeState {}

class SearchLoading extends HomeState {}

class SearchFailure extends HomeState {
  final String error;

  SearchFailure(this.error);
}
class SearchNoInternetConnection extends HomeState {}


class SearchMoreProductsSuccess extends HomeState {}

class SearchMoreProductsLoading extends HomeState {}

class SearchMoreProductsFailure extends HomeState {
  final String error;

  SearchMoreProductsFailure(this.error);
}
class SearchMoreProductsNoInternetConnection extends HomeState {}


class SubCategoryLoading extends HomeState {}

class SubCategorySuccess extends HomeState {}

class SubCategoryFailure extends HomeState {
  final String error;

  SubCategoryFailure(this.error);
}

class HomeUpdated extends HomeState {}
