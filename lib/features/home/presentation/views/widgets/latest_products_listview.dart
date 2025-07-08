import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_mart/features/home/data/models/product_model/product_model.dart';
import 'package:quick_mart/features/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:quick_mart/features/home/presentation/views/widgets/product_card.dart';

class LatestProductsGridView extends StatelessWidget {
  final List<ProductModel> products;

  const LatestProductsGridView({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {

      },
      builder: (context, state) {
        return SizedBox(
          child: GridView.builder(
            padding: EdgeInsets.zero,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: products.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 7,
              childAspectRatio: 0.7,
            ),
            itemBuilder: (context, index) {
              final product = products[index];
              final isLoading = state is DeleteFavoriteLoading || state is SetFavoriteLoading && state.productId   == product.productId;
              return ProductCard(
                model: product,
                isLoading: isLoading,
              );
            },
          ),
        );
      },
    );
  }
}