import 'package:flutter/material.dart';
import 'package:quick_mart/features/home/presentation/views/widgets/product_details_view_body.dart';

import '../../data/models/product_model/product_model.dart';

class ProductDetailsView extends StatelessWidget {
 final ProductModel model ;
  const ProductDetailsView({super.key, required this.model});
  static const routeName = 'productDetails';
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ProductDetailsViewBody(model: model ,));
  }
}
