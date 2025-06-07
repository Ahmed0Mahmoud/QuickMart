import 'package:flutter/material.dart';
import 'package:quick_mart/features/cart/presentation/views/widgets/cart_view_body.dart';
class CartView extends StatelessWidget {
  const CartView({super.key});
static const routeName = 'cart';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CartViewBody(),
    );
  }
}
