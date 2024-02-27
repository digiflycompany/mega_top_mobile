import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/features/account_screens/orders_screen/cubit/orders_details_state.dart';

class OrdersDetailsCubit extends Cubit<OrdersDetailsState> {
  OrdersDetailsCubit() : super(OrdersDetailsInitial());

  static OrdersDetailsCubit get(context) => BlocProvider.of(context);

  int currentStep = 4;
}
