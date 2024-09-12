import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/features/offers_screens/cubit/offers_cubit.dart';
import 'package:mega_top_mobile/features/offers_screens/cubit/offers_state.dart';


class ProductImages extends StatelessWidget {
  const ProductImages({super.key});

  @override
  Widget build(BuildContext context) {
    OffersCubit offersCubit = context.read<OffersCubit>();
    return Expanded(
      child: BlocBuilder<OffersCubit, OffersState>(
        builder: (context, state) {
          return PageView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: offersCubit.offerModel!
                .data!.products[offersCubit.selectedProductIndex].images!.length,
            onPageChanged: (index) => offersCubit.setImageIndex(index),
            itemBuilder: (context, index) {
              return Image.network(
                  offersCubit.offerModel!
                      .data!.products[offersCubit.selectedProductIndex].images![index],

              );
            },
          );
        },
      ),
    );
  }
}
