import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/widgets/available_container.dart';
import 'package:mega_top_mobile/core/widgets/discount_container.dart';
import 'package:mega_top_mobile/core/widgets/list_product_name.dart';
import 'package:mega_top_mobile/core/widgets/list_product_price.dart';
import 'package:mega_top_mobile/core/widgets/list_product_type.dart';
import 'package:mega_top_mobile/core/widgets/product_photo_list_view.dart';
import 'package:mega_top_mobile/features/categories_screens/cubit/category_cubit.dart';
import 'package:mega_top_mobile/features/categories_screens/cubit/category_state.dart';

class ProductsListContainer extends StatelessWidget {
  final int? index;
  final String? productPhoto;
  final String? productName;
  final String? productType;
  final String? productPrice;
  final String? discountPercent;
  final bool? discount;
  final String? icon;
  final Function ? onTap;
  final Function()? onTapFavourite;

  const ProductsListContainer(
      {super.key,
      this.productPhoto,
      this.productName,
      this.productType,
      this.productPrice,
      this.discount = false,
      this.discountPercent,
      this.icon = AppAssets.favourOutlinedIcon,
      this.onTapFavourite,
      this.index, this.onTap});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(builder: (context, state) {
      return GestureDetector(
        onTap: () {
          onTap!();
        },
        child: Container(
          width: double.infinity,
          height: context.height * 0.165,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(context.height * 0.0065),
            boxShadow: const [
              BoxShadow(
                color: AppColors.containerShadow,
                offset: Offset(0, 2),
                blurRadius: 12,
                spreadRadius: 0,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.only(
                    start: context.width * 0.022,
                    end: context.width * 0.045,
                    top: context.height * 0.012,
                    bottom: context.height * 0.012),
                child: Stack(
                  children: [
                    ProductPhotoListView(
                      photo: productPhoto,
                    ),
                    discount == true
                        ? Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: context.height * 0.009,
                                horizontal: context.width * 0.016),
                            child: DiscountContainer(
                              discountPercent: discountPercent,
                              width: context.width * 0.1,
                              height: context.height * 0.028,
                            ),
                          )
                        : Container(),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.only(
                      end: context.width * 0.045,
                      top: context.height * 0.03,
                      bottom: context.height * 0.03),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListProductName(
                        text: productName,
                      ),
                      ListProductType(
                        text: productType,
                      ),
                      //const Spacer(),
                      Row(
                        children: [
                          const AvailableContainer(),
                          const Spacer(),
                          ListProductPrice(
                            text: productPrice,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
