import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/widgets/no_internet_page.dart';
import 'package:mega_top_mobile/features/account_screens/orders_screen/data/repositories/orders_repo.dart';
import 'package:mega_top_mobile/features/account_screens/orders_screen/presentation/cubit/orders_cubit.dart';
import 'package:mega_top_mobile/features/account_screens/orders_screen/presentation/cubit/orders_state.dart';
import 'package:mega_top_mobile/features/account_screens/orders_screen/presentation/widgets/order_details_card_shimmer.dart';
import 'package:mega_top_mobile/features/account_screens/orders_screen/presentation/widgets/order_status_card.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/widgets/order_details_checkout_card.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/widgets/payment_method_small_card.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/widgets/shipping_checkout_details_small_card.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/widgets/your_order_checkout_card.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/primary_app_bar.dart';

class YourOrderDetailsScreen extends StatelessWidget {
  final String? orderId;

  const YourOrderDetailsScreen({super.key,
    required this.orderId,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(double.infinity, context.height * 0.089),
          child: const PrimaryAppBar(
            AppStrings.orderDetailsEn,
            favour: false,
          )),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.width16,),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: BlocProvider(
            create: (context) => OrdersCubit(OrdersRepoImp())..getUserOrder(orderId!),
            child: BlocBuilder<OrdersCubit, OrdersState>(
              builder: (context, state) {
                if(state is UserOrderLoading){
                  return ShimmerCardColumn();
                }
                if(state is UserOrderLoaded){
                  return Column(
                    children: [
                      OrderStatusCard(orderId: state.user.data!.id,),
                      OrderDetailsCheckoutCard(
                        productPrice: state.user.data!.totalPrice.toString(),
                        productQuantity: state.user.data!.products!.length.toString(),
                        totalPrice: state.user.data!.totalPrice.toString(),
                      ),
                      ShippingCheckoutDetailsSmallCard(
                        name: state.user.data!.dropOffAddress!.name,
                        address: state.user.data!.dropOffAddress!.firstLine,
                        city: state.user.data!.dropOffAddress!.cityName,
                      ),
                      PaymentMethodSmallCard(
                        paymentMethod: AppStrings.cashOnDeliveryEn,
                      ),
                      YourOrderCheckoutCard(
                        products: state.user.data!.products,
                      ),
                    ],
                  );
                }
                else if(state is UserOrderFailure){
                  context.read<OrdersCubit>().showErrorToast(context, AppStrings.failedToLoadOrderDetails, state.error);
                }
                else if(state is OrdersNoInternetConnection){
                  return NoInternetScreen(buttonOnTap: ()=>context.read<OrdersCubit>().getUserOrder(orderId!));
                }
                  return Container();
              },
            ),
          ),
        ),
      ),
    );
  }
}
