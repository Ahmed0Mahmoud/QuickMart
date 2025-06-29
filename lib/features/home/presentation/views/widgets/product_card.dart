import 'package:flutter/material.dart';
import 'package:quick_mart/features/home/presentation/views/product_details_view.dart';

import '../../../../../core/utils/app_text_styles.dart';
import '../../../data/models/product_model/product_model.dart';
import 'favorites_button.dart';

class ProductCard extends StatelessWidget {
  final ProductModel model;
  const ProductCard({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, ProductDetailsView.routeName,arguments: model);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 5,
        children: [
          Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.height * 0.2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: Colors.red,
                  image:  DecorationImage(
                    image: NetworkImage(model.imageUrl!),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const Positioned(right: 6, top: 6, child: FavoriteButton(size: 20,)),
            ],
          ),
          Text(
            model.productName!,
            style: TextStyles.medium14,
            overflow: TextOverflow.ellipsis,
          ),
          Text('\$${model.price}', style: TextStyles.semiBold13),
        ],
      ),
    );
  }
}
