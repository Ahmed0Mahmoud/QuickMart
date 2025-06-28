import 'package:flutter/material.dart';
import 'package:quick_mart/features/home/data/models/product_model/product_model.dart';
import 'package:quick_mart/features/home/presentation/views/widgets/product_card.dart';

class LatestProductsGridView extends StatelessWidget {
  final List<ProductModel> products;
  const LatestProductsGridView({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: GridView.builder(
        padding: EdgeInsets.zero,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 9,
          mainAxisSpacing: 12,
          childAspectRatio: 0.7,
        ),
        itemBuilder: (context, index) {
          return ProductCard(model: products[index],);
        },
      ),
    );
  }
}
