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

