import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/features/account_screens/address_screen/cubit/add_address_details_state.dart';

class AddAddressDetailsCubit extends Cubit<AddAddressDetailsState> {
  AddAddressDetailsCubit() : super(InitAddAddressDetailsState());

  static AddAddressDetailsCubit get(context) => BlocProvider.of(context);

  final addressLabelOption = [AppStrings.homeEn, AppStrings.work];

  String selectedAddressLabelOption = AppStrings.homeEn;

  void changeSelectedAddressLabelOption(String text) {
    selectedAddressLabelOption = text;
    emit(ChangeSelectedAddressLabelOptionState());
  }
}
