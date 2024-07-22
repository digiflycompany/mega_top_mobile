import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/features/account_screens/account_details_screen/data/repositories/account_details_repo.dart';
import 'package:mega_top_mobile/features/account_screens/account_details_screen/presentation/cubit/account_details_state.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/custom_error_toast.dart';

class AccountDetailsCubit extends Cubit<AccountDetailsState> {
  final AccountDetailsRepo accountDetailsRepo;
  AccountDetailsCubit(this.accountDetailsRepo) : super(AccountDetailsInitial());

  static AccountDetailsCubit getCubit(context) => BlocProvider.of(context);

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

}
