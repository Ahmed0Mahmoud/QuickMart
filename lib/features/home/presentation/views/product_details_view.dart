import 'package:flutter/material.dart';
import 'package:quick_mart/features/home/presentation/views/widgets/product_details_view_body.dart';
class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key});
static const routeName = 'productDetails';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProductDetailsViewBody(),
    );
  }
}
