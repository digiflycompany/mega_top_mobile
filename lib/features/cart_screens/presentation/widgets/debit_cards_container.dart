import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/features/cart_screens/cubit/cart_states.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/widgets/cvv_card_container.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/widgets/payment_card_icon.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/widgets/payment_card_text.dart';
import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/spacer.dart';
import '../../cubit/cart_cubit.dart';
import 'add_new_card_button.dart';

class DebitCardsContainer extends StatelessWidget {
  final String? paymentIcon;
  final String? paymentType;
  final bool isSelected;
  final String value;
  final int? paymentCardIndex;

  const DebitCardsContainer(
      {super.key, this.paymentIcon, this.paymentType, required this.isSelected, required this.value, this.paymentCardIndex});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        CartCubit cartCubit = CartCubit.getCubit(context);
        return Container(
          width: double.infinity,
          height: context.height * 0.413,
          decoration: BoxDecoration(
            color: isSelected ? AppColors.iconsBackgroundColor : Colors.white,
            border: Border.all(
                color: isSelected ? AppColors.primaryColor : AppColors
                    .smallContainerGreyColor, width: 1.w),
            borderRadius: BorderRadius.circular(4.r),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: context.width * 0.045,vertical: context.height*0.02),
            child: Column(
              children: [
                Padding(
                  padding:  EdgeInsets.only(bottom:context.height*0.011),
                  child: Row(
                    children: [
                      PaymentCardIcon(icon: paymentIcon),
                      HorizontalSpace(context.width * 0.022),
                      PaymentCardText(text: paymentType),
                      const Spacer(),
                      Transform.scale(
                        scale: 1.2.r,
                        child: Radio(
                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          visualDensity: const VisualDensity(
                              vertical: -4, horizontal: -4),
                          activeColor: AppColors.primaryColor,
                          focusColor: Colors.black,
                          value: value,
                          groupValue: cartCubit.selectedValue,
                          onChanged: (String? newValue) {
                            if (newValue != null) {
                              cartCubit.selectOption(newValue);
                              cartCubit.selectPaymentCard(paymentCardIndex!);
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(color: AppColors.dotsColor,thickness: 1.w,),
                VerticalSpace(context.height*0.033),
                const CvvCardContainer(
                  cardIcon: AppAssets.masterCardImg,
                  cardNumber: AppStrings.cardEndsWithEn,
                ),
                const CvvCardContainer(
                  cardIcon: AppAssets.masterCardImg,
                  cardNumber: AppStrings.cardEndsWithEn,
                ),
                const Spacer(),
                const AddNewCardButton(),
              ],
            ),
          ),
        );
      },
    );
  }
}
