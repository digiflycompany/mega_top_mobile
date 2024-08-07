import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/widgets/custom_animated_icon_toast.dart';
import 'package:mega_top_mobile/features/account_screens/address_screen/data/repositories/address_repo.dart';
import 'package:mega_top_mobile/features/account_screens/address_screen/presentation/cubit/address_state.dart';

class AddressCubit extends Cubit<AddressState> {
  final AddressRepo addressRepo;
  AddressCubit(this.addressRepo) : super(AddressInitial());

  TextEditingController addressController = TextEditingController();
  TextEditingController addressDetailsController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  String city = '';

  Future<void> getUserAddresses() async {
    emit(UserAddressesLoading());
    try {
      final user = await addressRepo.getUserAddresses();
      if (user != null && user.success == true) {
        emit(UserAddressesSuccess(user));
      } else {
        emit(UserAddressesFailure(user?.message ?? AppStrings.invalidCred));
      }
    } catch (e) {
      if (e is DioException && e.error == AppStrings.noInternetConnection) {
        emit(AddressNoInternetConnection());
      } else {
        emit(UserAddressesFailure(e.toString()));
      }
    }
  }

  void savedSuccessToast(BuildContext context,String message) {
    OverlayEntry? overlayEntry;
    overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: kToolbarHeight + MediaQuery.of(context).padding.top,
        width: MediaQuery.of(context).size.width,
        child: AnimatedOverlayIconToast(
          toastIcon: AppAssets.checkIcon,
          message: message,
          color: AppColors.primaryGreenColor,
          onDismissed: () {
            if (overlayEntry != null) {
              overlayEntry!.remove();
              overlayEntry = null;
            }
          },
        ),
      ),
    );

    SchedulerBinding.instance.addPostFrameCallback((_) {
      Overlay.of(context).insert(overlayEntry!);
    });
  }

  Future<void> getCities() async {
    emit(CitiesLoading());
    try {
      final user = await addressRepo.getCities();
      if (user != null && user.success == true) {
        emit(CitiesSuccess(user));
      } else {
        emit(CitiesFailure(user?.message ?? AppStrings.invalidCred));
      }
    } catch (e) {
      if (e is DioException && e.error == AppStrings.noInternetConnection) {
        emit(AddressNoInternetConnection());
      } else {
        emit(CitiesFailure(e.toString()));
      }
    }
  }

  Future<void> addNewAddress(String name, String address, String addressDetails, String cityId) async {
    emit(AddNewAddressLoading());
    try {
      final user = await addressRepo.addNewAddress(name, address, addressDetails, cityId);
      if (user != null && user.success == true) {
        emit(AddNewAddressSuccess(user));
      } else {
        emit(AddNewAddressFailure(user?.message ?? AppStrings.invalidCred));
      }
    } catch (e) {
      if (e is DioException && e.error == AppStrings.noInternetConnection) {
        emit(AddressNoInternetConnection());
      } else {
        emit(AddNewAddressFailure(e.toString()));
      }
    }
  }
  @override
  Future<void> close() {
    nameController.dispose();
    addressController.dispose();
    addressDetailsController.dispose();
    return super.close();
  }
}
