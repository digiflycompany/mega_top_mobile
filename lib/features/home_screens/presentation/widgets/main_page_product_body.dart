import 'package:flutter/material.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/main_page_product_main_description.dart';

class MainPageProductDetailedBody extends StatelessWidget {
  final String? name;
  final String? categoryName;
  final String? finalPrice;
  final String? originalPrice;
  final String? description;
  final int? quantity;
  final cubit;
  const MainPageProductDetailedBody({
    super.key,
    required this.name,
    required this.categoryName,
    required this.finalPrice,
    required this.originalPrice,
    required this.description,
    required this.quantity,
    required this.cubit
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.width * 0.045),
      child: Column(
        children: [
          MainPageProductMainDescription(
            name: name,
            quantity: quantity,
            categoryName: categoryName,
            cubit: cubit,
            description: description,
            finalPrice: finalPrice,
            originalPrice: originalPrice,
          ),
          VerticalSpace(context.height * 0.04),
        ],
      ),
    );
  }
}
