import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/features/categories_screens/cubit/category_cubit.dart';
import 'package:mega_top_mobile/features/categories_screens/cubit/category_state.dart';
import '../../../../core/utils/spacer.dart';
import 'our_products_container.dart';

class OurProductsList extends StatelessWidget {
  const OurProductsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoryCubit, CategoryState>(
   listener: (context, state) {},
   builder: (context, state) {
     var cubit = context.read<CategoryCubit>();
     if (cubit.categories.isNotEmpty){
       var categories = cubit.categories;
       return Padding(
         padding: EdgeInsets.symmetric(horizontal: context.width * 0.03),
         child: SizedBox(
           height: context.height * 0.14,
           child: ListView.builder(
             scrollDirection: Axis.horizontal,
             itemCount: categories.length,  // Assuming you want 3 items as in your original code
             itemBuilder: (BuildContext context, int index) {
               // You can adjust the itemBuilder to return different widgets based on the index if needed
               final category = categories[index];
               return Row(
                 children: [
                   OurProductsContainer(
                     productPhoto: category.image?.src,
                     productName: category.name,
                     productQuantity: category.count.toString(),
                   ),
                   HorizontalSpace(context.width * 0.045),  // Space between items
                 ],
               );
             },
           ),
         ),
       );
     } else{
       Center(
         child: Theme(
           data: Theme.of(context).copyWith(
             colorScheme: ColorScheme.fromSwatch().copyWith(
               primary: AppColors.primaryColor,
             ),
           ),
           child: CircularProgressIndicator.adaptive(),
         ),
       );
     }
     return Container();
  },
);
  }
}
