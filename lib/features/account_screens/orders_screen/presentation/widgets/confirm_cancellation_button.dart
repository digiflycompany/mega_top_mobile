import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/utils/global_cubit.dart';
import 'package:mega_top_mobile/core/utils/global_state.dart';
import 'package:mega_top_mobile/core/widgets/primary_button.dart';

class ConfirmCancellationButton extends StatelessWidget {
  const ConfirmCancellationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GlobalCubit, GlobalState>(
      builder: (context, state) {
        GlobalCubit globalCubit = context.read<GlobalCubit>();
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: context.width16),
          child: PrimaryButton(
            text: AppStrings.confirm,
            onTap: () {
              Navigator.pop(context);
              globalCubit.showPrimaryToast(context, AppStrings.orderHasBeenCancelled);
            },
          ),
        );
      },
    );
  }
}
