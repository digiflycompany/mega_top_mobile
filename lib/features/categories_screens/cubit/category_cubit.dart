import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/features/categories_screens/cubit/category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial());

  CategoryCubit getCubit(context) => BlocProvider.of(context);

  bool isGrid = true;

  bool noResult = false;


  void toggleList() {
    isGrid = !isGrid;
    emit(CategoryInitial());
  }

}
