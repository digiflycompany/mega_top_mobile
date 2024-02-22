import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/features/account_screens/address_screen/cubit/address_state.dart';

class AddressCubit extends Cubit<AddressState> {
  AddressCubit() : super(AddressInitial());

}
