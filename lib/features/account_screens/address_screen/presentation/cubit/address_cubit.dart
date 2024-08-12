import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/widgets/custom_animated_icon_toast.dart';
import 'package:mega_top_mobile/core/widgets/remove_item_dialog.dart';
import 'package:mega_top_mobile/features/account_screens/address_screen/data/repositories/address_repo.dart';
import 'package:mega_top_mobile/features/account_screens/address_screen/presentation/cubit/address_state.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/custom_error_toast.dart';

class AddressCubit extends Cubit<AddressState> {
  final AddressRepo addressRepo;
  AddressCubit(this.addressRepo) : super(AddressInitial());

  TextEditingController addressController = TextEditingController();
  TextEditingController addressDetailsController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  String city = '';
  String id = '';
  String? selectedAddressId;

  void selectAddress(String addressId){
    selectedAddressId = addressId;
  }

  void updateCity(String cityId) {
    city = cityId;
  }

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

  void showErrorToast(BuildContext context, String title, String text) {
    OverlayEntry? overlayEntry;
    overlayEntry = OverlayEntry(
      builder: (context) => Align(
        alignment: Alignment.bottomCenter,
        child: CustomErrorToast(
          title: title,
          message: text,
          color: AppColors.redIconColor,
          onDismissed: () {
            if (overlayEntry != null) {
              overlayEntry!.remove();
              overlayEntry = null;
            }
          },
        ),
      ),
    );
    Overlay.of(context).insert(overlayEntry!);
  }

  void showRemoveItemDialog(BuildContext context, String addressID) {
    if (Platform.isIOS) {
      showCupertinoDialog(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            content: RemoveItemDialog(
              onTap: () {
                deleteAddress(addressID);
                Future.delayed(Duration(milliseconds: 400), () {
                  if (Navigator.canPop(context)) {
                    Navigator.pop(context);
                  }
                });
              },
            ),
          );
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            contentPadding: EdgeInsets.zero,
            content: RemoveItemDialog(
              onTap: () {
                deleteAddress(addressID);
                Future.delayed(Duration(seconds: 1), () {
                  if (Navigator.canPop(context)) {
                    Navigator.pop(context);
                  }
                });
              },
            ),
          );
        },
      );
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

  Future<void> deleteAddress(String addressID) async {
    emit(DeleteAddressLoading());
    try {
      final user = await addressRepo.deleteAddress(addressID);
      if (user != null && user.success == true) {
        emit(DeleteAddressSuccess(user));
        getUserAddresses();
      } else {
        emit(DeleteAddressFailure(user?.message ?? AppStrings.invalidCred));
      }
    } catch (e) {
      if (e is DioException && e.error == AppStrings.noInternetConnection) {
        emit(AddressNoInternetConnection());
      } else {
        emit(DeleteAddressFailure(e.toString()));
      }
    }
  }

  Future<void> updateAddress(
      String addressID,
      String name,
      String address,
      String addressDetails,
      String cityId
      ) async {
    emit(EditAddressLoading());
    try {
      final user = await addressRepo.updateAddress(
          addressID,
          name,
          address,
          addressDetails,
          cityId
      );
      if (user != null && user.success == true) {
        emit(EditAddressSuccess(user));
        getUserAddresses();
      } else {
        emit(EditAddressFailure(user?.message ?? AppStrings.invalidCred));
      }
    } catch (e) {
      if (e is DioException && e.error == AppStrings.noInternetConnection) {
        emit(AddressNoInternetConnection());
      } else {
        emit(EditAddressFailure(e.toString()));
      }
    }
  }

  void handleAddNewAddressState(BuildContext context, AddressState state){
    if(state is AddNewAddressSuccess){
      Navigator.pop(context);
      savedSuccessToast(context, AppStrings.savedSuccessfully);
    }
    else if(state is AddNewAddressFailure){
      showErrorToast(context, AppStrings.savingAddressFailed,state.error);
    }
  }
  void handleUpdateAddressState(BuildContext context, AddressState state){
    if(state is EditAddressSuccess){
      Navigator.pop(context);
      savedSuccessToast(context, AppStrings.updatedSuccessfully);
    }
    else if(state is EditAddressFailure){
      showErrorToast(context, AppStrings.editingAddressFailed,state.error);
    }
  }
  void handleDeleteAddressState(BuildContext context, AddressState state){
    if(state is DeleteAddressSuccess){
      savedSuccessToast(context, AppStrings.removedSuccessfully);
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
