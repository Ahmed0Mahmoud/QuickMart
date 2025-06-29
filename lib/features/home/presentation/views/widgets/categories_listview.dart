import 'package:flutter/material.dart';
import 'package:quick_mart/features/home/data/models/product_model/product_model.dart';
import 'category_card.dart';

class CategoriesListView extends StatelessWidget {
  final List<ProductModel> products;
  const CategoriesListView({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.1,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 9),
            child: CategoryCard(category: categories[index]),
          );
        },
      ),
    );
  }
}
