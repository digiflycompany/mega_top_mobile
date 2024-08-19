abstract class OffersState {}

class OffersInitial extends OffersState {}

class OffersUpdated extends OffersState {}

class OffersProductUpdated extends OffersState {}

class OffersLoading extends OffersState {}

class OffersSuccess extends OffersState {}

class OffersFailure extends OffersState {
  final String error;

  OffersFailure(this.error);
}

class OffersNoInternetConnection extends OffersState {}

class OffersMoreProductLoading extends OffersState {}

class OffersMoreProductSuccess extends OffersState {}

class OffersMoreProductFailure extends OffersState {
  final String error;

  OffersMoreProductFailure(this.error);
}
class OffersMoreProductNoInternetConnection extends OffersState {}


class SubCategoryLoading extends OffersState {}

class SubCategorySuccess extends OffersState {}

class SubCategoryFailure extends OffersState {
  final String error;

  SubCategoryFailure(this.error);
}

