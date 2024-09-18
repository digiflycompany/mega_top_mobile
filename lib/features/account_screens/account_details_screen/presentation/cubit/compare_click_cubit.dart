import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/core/services/shared_preferences/preferences_helper.dart';
import 'package:mega_top_mobile/core/widgets/main_page_products_model.dart';
import 'package:mega_top_mobile/features/account_screens/account_details_screen/presentation/cubit/compare_click_state.dart';

class CompareClickCubit extends Cubit<CompareClickState> {
  CompareClickCubit() : super(CompareClickInitial());

  List<Product> compareList = [];

  goToComparison(bool? fromCompareScreen) {
    compareList = PreferencesHelper.getCompareList();
    fromCompareScreen == true? emit(CompareClickSuccessFromComparePage(compareList.isEmpty)):emit(CompareClickSuccess(compareList.isEmpty));
  }
}
