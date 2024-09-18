import 'package:mega_top_mobile/features/home_screens/data/models/ad_details_model.dart';

sealed class AdDetailsState {}

final class AdDetailsInitial extends AdDetailsState {}

final class AdLoadingState extends AdDetailsState {}

final class NoInternetState extends AdDetailsState {}

final class AdSuccessState extends AdDetailsState {
  final AdDetailsModel data;
  AdSuccessState(this.data);
}

final class AdErrorState extends AdDetailsState {
  final String errorMessage;
  AdErrorState(this.errorMessage);
}
