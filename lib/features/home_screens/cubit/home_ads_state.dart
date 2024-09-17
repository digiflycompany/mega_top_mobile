import 'package:mega_top_mobile/features/home_screens/data/models/advertisement_model.dart';

sealed class HomeAdsState {}

final class HomeAdsInitial extends HomeAdsState {}

final class GetAdsLoadingState extends HomeAdsState {}

final class GetAdsSuccessState extends HomeAdsState {
  final List<Advertisement> ads;
  GetAdsSuccessState(this.ads);
}

final class GetAdsErrorState extends HomeAdsState {
  final String errorMessage;
  GetAdsErrorState(this.errorMessage);
}