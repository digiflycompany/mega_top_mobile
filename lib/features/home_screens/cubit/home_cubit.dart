import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/features/home_screens/cubit/home_states.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  HomeCubit getCubit(context) => BlocProvider.of(context);

  void setImageIndex(int index) {
    emit(ImageChanged(index: index));
  }

}