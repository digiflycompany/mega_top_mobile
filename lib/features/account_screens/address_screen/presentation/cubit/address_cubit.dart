import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/logger.dart';
import 'package:mega_top_mobile/core/widgets/custom_animated_icon_toast.dart';
import 'package:mega_top_mobile/core/widgets/remove_item_dialog.dart';
import 'package:mega_top_mobile/features/account_screens/address_screen/data/models/user_addresses_model.dart';
import 'package:mega_top_mobile/features/account_screens/address_screen/data/repositories/address_repo.dart';
import 'package:mega_top_mobile/features/account_screens/address_screen/presentation/cubit/address_state.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/custom_error_toast.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mega_top_mobile/services/shared_preferences/preferences_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddressCubit extends Cubit<AddressState> {
  final AddressRepo addressRepo;
  AddressCubit(this.addressRepo) : super(AddressInitial());

  TextEditingController addressController = TextEditingController();
  TextEditingController addressDetailsController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  String? city;
  String id = '';
  String? selectedAddressId;
  var formKey = GlobalKey<FormState>();

  void selectAddress(String addressId) {
    selectedAddressId = addressId;
  }

  void updateCity(String cityId) {
    city = cityId;
  }

  Future<void> getUserAddresses() async {
    emit(UserAddressesLoading());
    log('Address is loading...', name: 'From Cubit');
    final response = await addressRepo.getUserAddresses();
    response.fold((failure) {
      DefaultLogger.logger.e(failure.errMessage);
      emit(UserAddressesFailure(failure.errMessage));
    }, (address) {
      emit(UserAddressesSuccess(address!));
    });
  }

  Future<void> getSingleAddress(String addressId) async {
    emit(UserAddressesLoading());
    final response = await addressRepo.getSingleAddress(addressId);
    response.fold((failure) {
      DefaultLogger.logger.e(failure.errMessage);
      emit(UserAddressesFailure(failure.errMessage));
    }, (address) async {
      city = address?.cityId?.name ?? '';
      await PreferencesHelper.saveCityName(city!).then((value) => DefaultLogger.logger.i(PreferencesHelper.getCityName()));
      emit(UserAddressesSuccess(
          UserAddressesModel(success: true, data: [address!])));
    });
  }

  void savedSuccessToast(BuildContext context, String message) {
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
                })));

    SchedulerBinding.instance.addPostFrameCallback((_) {
      Overlay.of(context).insert(overlayEntry!);
    });
  }

  Future<void> getCities() async {
    emit(CitiesLoading());
    try {
      final response = await addressRepo.getCities();
      if (response != null && response.success == true) {
        final citiesList = response.data?.cities;
        final Map<String, String> citiesMap = {
          for (var city in citiesList!) city.id: city.name
        };

        await PreferencesHelper.saveCities(citiesMap)
            .then((value) => DefaultLogger.logger.e(citiesMap));

        emit(CitiesSuccess(response));
      } else {
        emit(CitiesFailure(response?.message ?? ''));
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
                })));
    Overlay.of(context).insert(overlayEntry!);
  }

  void showRemoveItemDialog(BuildContext context, String addressID) {
    if (Platform.isIOS) {
      showCupertinoDialog(
          context: context,
          builder: (BuildContext context) {
            return CupertinoAlertDialog(content: RemoveItemDialog(onTap: () {
              deleteAddress(addressID);
              Future.delayed(Duration(milliseconds: 400), () {
                if (Navigator.canPop(context)) {
                  Navigator.pop(context);
                }
              });
            }));
          });
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
                backgroundColor: Colors.white,
                contentPadding: EdgeInsets.zero,
                content: RemoveItemDialog(onTap: () {
                  deleteAddress(addressID);
                  Future.delayed(Duration(seconds: 1), () {
                    if (Navigator.canPop(context)) {
                      Navigator.pop(context);
                    }
                  });
                }));
          });
    }
  }

  Future<void> addNewAddress(
      String name, String address, String addressDetails, String cityId) async {
    emit(AddNewAddressLoading());
    try {
      final user = await addressRepo.addNewAddress(
          name, address, addressDetails, cityId);
      if (user != null && user.success == true) {
        emit(AddNewAddressSuccess(user));
      } else {
        emit(AddNewAddressFailure(user?.message ?? ''));
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
        emit(DeleteAddressFailure(user?.message ?? ''));
      }
    } catch (e) {
      if (e is DioException && e.error == AppStrings.noInternetConnection) {
        emit(AddressNoInternetConnection());
      } else {
        emit(DeleteAddressFailure(e.toString()));
      }
    }
  }

  Future<String?> getCityIdByName(String cityName) async {
    var preferences = await SharedPreferences.getInstance();
    List<String>? cityIDs = preferences.getStringList('citiesIDs');
    List<String>? cityNames = preferences.getStringList('citiesNames');

    if (cityIDs != null && cityNames != null) {
      for (int i = 0; i < cityNames.length; i++) {
        if (cityNames[i] == cityName) {
          return cityIDs[i];
        }
      }
    }
    return null;
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
      Map<String, String> cityMap = await PreferencesHelper.getCities();

      String? findKeyOrValue(Map<String, String> map, String text) {
        if (map.containsKey(text)) {
          // return text;
          return map.entries.firstWhere(
                  (entry) => entry.value == text,
              orElse: () => MapEntry('', '')
          ).value;
        }
        if (map.containsValue(text)) {
          // return map.entries.firstWhere(
          //         (entry) => entry.value == text,
          //     orElse: () => MapEntry('', '')
          // ).key;
          return text;
        }
        return null;
      }

      final resolvedCityId = findKeyOrValue(cityMap, cityId);

      if (resolvedCityId == null) {
        emit(EditAddressFailure('City ID not found in map'));
        return;
      }

      final user = await addressRepo.updateAddress(
          addressID,
          resolvedCityId,
          address,
          addressDetails,
          resolvedCityId
      );

      user.fold(
              (failure) {
            DefaultLogger.logger.e(failure.errMessage);
            emit(EditAddressFailure(failure.errMessage));
          },
              (updateResponse) {
            emit(EditAddressSuccess(updateResponse!));
          }
      );
    } catch (e) {
      emit(EditAddressFailure(e.toString()));
    }
  }


  void handleAddNewAddressState(BuildContext context, AddressState state) {
    if (state is AddNewAddressSuccess) {
      Navigator.pop(context);
      savedSuccessToast(
          context, AppLocalizations.of(context)!.savedSuccessfully);
    } else if (state is AddNewAddressFailure) {
      showErrorToast(context, AppLocalizations.of(context)!.savingAddressFailed,
          state.error);
    }
  }

  void handleUpdateAddressState(BuildContext context, AddressState state) {
    if (state is EditAddressSuccess) {
      getUserAddresses();
      Navigator.pop(context);
      /*Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => ShippingAddressScreen()));*/
      savedSuccessToast(
          context, AppLocalizations.of(context)!.updatedSuccessfully);
    } else if (state is EditAddressFailure) {
      showErrorToast(context,
          AppLocalizations.of(context)!.editingAddressFailed, state.error);
    }
  }

  void handleDeleteAddressState(BuildContext context, AddressState state) {
    if (state is DeleteAddressSuccess) {
      savedSuccessToast(
          context, AppLocalizations.of(context)!.removedSuccessfully);
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
