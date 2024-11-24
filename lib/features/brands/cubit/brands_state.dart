import 'package:mega_top_mobile/features/brands/data/models/brands_response.dart';

sealed class BrandsState {}

final class BrandsInitial extends BrandsState {}

final class BrandsLoadingState extends BrandsState {}
final class BrandsNoInternetConnection extends BrandsState {}
final class BrandsFailureState extends BrandsState {
  final String error;
  BrandsFailureState(this.error);
}
final class BrandsSuccessState extends BrandsState {
  final List<Brand> brands;
  BrandsSuccessState(this.brands);
}
