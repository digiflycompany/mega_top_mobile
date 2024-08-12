abstract class CategoryState {}

class CategoryInitial extends CategoryState {}

class CategoryUpdated extends CategoryState {}

class CategorySuccess extends CategoryState {}

class CategoryLoading extends CategoryState {}

class CategoryFailure extends CategoryState {
  final String error;

  CategoryFailure(this.error);
}

class CategoryProductUpdated extends CategoryState {}

class SelectedCategoryLoading extends CategoryState {}

class SelectedCategorySuccess extends CategoryState {}

class SelectedCategoryFailure extends CategoryState {
  final String error;

  SelectedCategoryFailure(this.error);
}

class SubCategoryLoading extends CategoryState {}

class SubCategorySuccess extends CategoryState {}

class SubCategoryFailure extends CategoryState {
  final String error;

  SubCategoryFailure(this.error);
}

class addToCartLoading extends CategoryState {}

class addToCartSuccess extends CategoryState {}

class addToCartFailure extends CategoryState {
  final String error;

  addToCartFailure(this.error);
}

class myOrdersLoading extends CategoryState {}

class myOrdersSuccess extends CategoryState {}

class myOrdersFailure extends CategoryState {
  final String error;

  myOrdersFailure(this.error);
}

class productDetailsLoading extends CategoryState {}

class productDetailsSuccess extends CategoryState {}

class productDetailsFailure extends CategoryState {
  final String error;

  productDetailsFailure(this.error);
}

