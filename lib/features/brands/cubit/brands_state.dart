import 'package:mega_top_mobile/core/widgets/main_page_products_model.dart';
import 'package:mega_top_mobile/features/brands/data/models/brands_response.dart';

sealed class BrandsState {}

final class BrandsInitial extends BrandsState {}
final class ProductsLoadingState extends BrandsState {}
final class BrandUpdated extends BrandsState {}
final class MoreProductsLoading extends BrandsState {}
final class ProductsNoInternetConnection extends BrandsState {}
final class ProductsFailureState extends BrandsState {
  final String error;
  ProductsFailureState(this.error);
}
final class ProductsSuccessState extends BrandsState {
  final List<Product> products;
  ProductsSuccessState(this.products);
}
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
