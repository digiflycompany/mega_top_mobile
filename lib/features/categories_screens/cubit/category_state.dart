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

