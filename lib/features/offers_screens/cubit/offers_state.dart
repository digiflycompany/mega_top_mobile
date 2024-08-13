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

class SubCategoryLoading extends OffersState {}

class SubCategorySuccess extends OffersState {}

class SubCategoryFailure extends OffersState {
  final String error;

  SubCategoryFailure(this.error);
}

