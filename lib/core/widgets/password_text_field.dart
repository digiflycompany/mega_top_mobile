import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/features/authentication_screens/cubit/auth_cubit.dart';
import 'package:mega_top_mobile/features/authentication_screens/cubit/auth_state.dart';

import '../utils/app_color.dart';

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({super.key, this.hintText, this.prefixSvg, this.validator});

  final String? hintText;
  final String? prefixSvg;
  final validator;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationCubit, AuthenticationState>(
      listener: (BuildContext context, AuthenticationState state) {},
      builder: (BuildContext context, AuthenticationState state) {
        final cubit = AuthenticationCubit.getCubit(context);
        return TextFormField(
          validator: validator,
          cursorColor: AppColors.blackGreyColor,
          cursorHeight: context.width * 0.046,
          obscureText: cubit.isPasswordVisible,
          decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(
                color: AppColors.greyTextColor,
                fontWeight: FontWeight.w500,
                fontSize: 14.sp,
              ),
              enabledBorder: const UnderlineInputBorder(
                borderSide:
                    BorderSide(width: 1, color: AppColors.googleButtonBorder),
              ),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(width: 1, color: AppColors.primaryColor),
              ),
              prefixIconConstraints:
                  BoxConstraints(minWidth: context.width * 0.072),
              prefixIcon: prefixSvg != null
                  ? Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(
                          prefixSvg!,
                          width: context.width * 0.063,
                          height: context.height * 0.026,
                          fit: BoxFit.scaleDown,
                        ),
                      ],
                    )
                  : null,
              suffixIconConstraints:
                  BoxConstraints(minWidth: context.width * 0.072),
              suffixIcon: GestureDetector(
                  onTap: () {
                    cubit.togglePasswordVisibility();
                  },
                  child: cubit.isPasswordVisible
                      ? SvgPicture.asset(
                          AppAssets.showPasswordIcon,
                          width: context.width * 0.063,
                          fit: BoxFit.scaleDown,
                        )
                      : SvgPicture.asset(
                          AppAssets.hidePasswordIcon,
                          width: context.width * 0.063,
                          fit: BoxFit.scaleDown,
                        ))),
        );
      },
    );
  }
}
