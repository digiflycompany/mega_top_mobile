import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/features/authentication_screens/cubit/sign_up_cubit/sign_up_cubit.dart';
import 'package:mega_top_mobile/features/authentication_screens/cubit/sign_up_cubit/sign_up_state.dart';
import 'package:mega_top_mobile/features/authentication_screens/data/repo/auth_repo.dart';

class UserEmailText extends StatelessWidget {
  const UserEmailText({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(AuthRepoImp()),
      child: BlocBuilder<SignUpCubit, SignUpState>(
        builder: (context, state) {
          SignUpCubit signUpCubit = context.read<SignUpCubit>();
          return Padding(
            padding: EdgeInsets.only(
                top: context.height6, bottom: context.height24),
            child: Text(
              '${signUpCubit.signUpEmailController.text}',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14.sp,
              ),
            ),
          );
        },
      ),
    );
  }
}
