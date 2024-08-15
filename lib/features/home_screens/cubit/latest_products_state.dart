import 'package:mega_top_mobile/core/widgets/main_page_products_model.dart';

abstract class LatestProductsState {}

class LatestProductsInitial extends LatestProductsState {}

class LatestProductsSuccess extends LatestProductsState {
  final MainPageProductsModel user;

  LatestProductsSuccess(this.user);
}

class LatestProductsFailure extends LatestProductsState {
  final String error;

  LatestProductsFailure(this.error);

}

class LatestProductsLoading extends LatestProductsState {}

class LatestProductsNoInternetConnection extends LatestProductsState {}



