import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_mart/features/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:quick_mart/features/home/presentation/views/product_details_view.dart';

import '../../../../../core/utils/app_text_styles.dart';
import '../../../data/models/product_model/product_model.dart';
import 'favorites_button.dart';

class ProductCard extends StatefulWidget {
  final ProductModel model;
  final bool isLoading;


  const ProductCard({super.key, required this.model, required this.isLoading});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    final homeCubit = context.read<HomeCubit>();
    final isFavorite = homeCubit.isFavorite(widget.model.productId!);

    return GestureDetector(
      onTap: () {
       Navigator.pushNamed(
         context,
         ProductDetailsView.routeName,
         arguments: widget.model,
       );

      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.height * 0.2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: Colors.red,
                  image: widget.model.imageUrl != null
                      ? DecorationImage(
                    image: NetworkImage(widget.model.imageUrl!),
                    fit: BoxFit.fill,
                  )
                      : null,
                ),
              ),
              Positioned(
                right: 8,
                top: 8,
                child:
                  FavoriteButton(
                  size: 28,
                  color: isFavorite ? Colors.red : Colors.grey,
                  onTap: () {
                    final isFav = homeCubit.isFavorite(widget.model.productId!);

                    // 1. Immediately toggle the local state
                    setState(() {
                      homeCubit.productsAreFavorite[widget.model.productId!] = !isFav;
                    });

                    // 2. Then make the API call (without awaiting it)
                    if (isFav) {
                      homeCubit.deleteFavorite(productId: widget.model.productId!);
                    } else {
                      homeCubit.setFavorite(productId: widget.model.productId!);
                    }
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Text(
            widget.model.productName ?? '',
            style: TextStyles.medium14,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            '\$${widget.model.price ?? ''}',
            style: TextStyles.semiBold13,
          ),
        ],
      ),
    );
  }
}