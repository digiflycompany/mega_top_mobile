import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/features/categories_screens/cubit/category_item_details_states.dart';

class categoryItemDetailsCubit extends Cubit<CategoryItemDetailsStates> {
  categoryItemDetailsCubit() : super(InitialCategoryItemDetailsStates());
}
