import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/widgets/remove_item_dialog.dart';
import 'package:mega_top_mobile/features/account_screens/address_screen/data/repositories/address_repo.dart';
import 'package:mega_top_mobile/features/account_screens/address_screen/presentation/cubit/address_state.dart';

class AddressCubit extends Cubit<AddressState> {
  final AddressRepo addressRepo;
  AddressCubit(this.addressRepo) : super(AddressInitial());

  /// Show Remove Item Dialog
  void showRemoveItemDialog(BuildContext context) {
    if (Platform.isIOS) {
      showCupertinoDialog(
        context: context,
        builder: (BuildContext context) {
          return const CupertinoAlertDialog(
            content: RemoveItemDialog(),
          );
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return const AlertDialog(
            backgroundColor: Colors.white,
            contentPadding: EdgeInsets.zero,
            content: RemoveItemDialog(),
          );
        },
      );
    }
  }

  Future<void> getUserAddresses() async {
    emit(UserAddressesLoading());
    try {
      final user = await addressRepo.getUserAddresses();
      if (user != null && user.success == true) {
        emit(UserAddressesSuccess(user));
      } else {
        emit(UserAddressesFailure(
            user?.message ?? AppStrings.invalidCred));
      }
    } catch (e) {
      if (e is DioException && e.error == AppStrings.noInternetConnection) {
        emit(AddressNoInternetConnection());
      } else {
        emit(UserAddressesFailure(e.toString()));
      }
    }
  }


}
