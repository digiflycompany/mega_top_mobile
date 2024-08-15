import 'package:mega_top_mobile/core/widgets/main_page_products_model.dart';

abstract class LatestOffersState {}

class LatestOffersInitial extends LatestOffersState {}

class LatestOffersSuccess extends LatestOffersState {
  final MainPageProductsModel user;

  LatestOffersSuccess(this.user);
}

class LatestOffersFailure extends LatestOffersState {
  final String error;

  LatestOffersFailure(this.error);

}

class LatestOffersLoading extends LatestOffersState {}

class LatestOffersNoInternetConnection extends LatestOffersState {}



