import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_mart/core/widgets/show_buttom_modal_sheet.dart';
import 'package:quick_mart/core/widgets/show_dialog.dart';
import 'package:quick_mart/features/home/presentation/manager/home_cubit/home_cubit.dart';

import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/widgets/custom_counter.dart';
import '../../../../home/data/models/product_model/product_model.dart';

class WishlistViewBody extends StatelessWidget {
  const WishlistViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          if (state is GetFavoriteFailure) {
            showAnimatedSnackbar(
              context: context,
              message: 'Failed to load favorites',
              type: AnimatedSnackBarType.error,
            );
          }
          else if (state is DeleteFavoriteSuccess) {

            showAnimatedSnackbar(
              context: context,
              message: 'Item removed',
              type: AnimatedSnackBarType.success,
            );

            context.read<HomeCubit>().clearCache();
            context.read<HomeCubit>().getFavoriteProducts();
          }
        },
      builder: (context, state) {
        if (state is GetFavoriteLoading || state is DeleteFavoriteLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is GetFavoriteSuccess && state.models.isNotEmpty) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(
              top: 60,
              bottom: 20,
            ),
            child: FavoriteProductsListView(favorites: state.models),
          );
        } else if (state is GetFavoriteSuccess && state.models.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.heart_broken,
                  size: 100,
                  color: Colors.grey,
                ),
                const SizedBox(height: 16),
                Text(
                  'No Favorites Yet! 🥶',
                  style: TextStyles.bold23.copyWith(
                    color: Colors.grey.shade700,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        } else if (state is GetFavoriteFailure || state is DeleteFavoriteFailure) {
          return const Center(
            child: Text('There was an error. Try again.'),
          );
        }
        else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

class FavoriteProductsListView extends StatelessWidget {
  final List<ProductModel> favorites;
  const FavoriteProductsListView({
    super.key, required this.favorites,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context , index){
      return Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: FavoriteCard(product: favorites[index],),
      );
    },itemCount: favorites.length,shrinkWrap: true,);
  }
}

class FavoriteCard extends StatelessWidget {
  final ProductModel product;
  const FavoriteCard({
    super.key, required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      //height: MediaQuery.of(context).size.height * 0.18,
      child:Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 15,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.35,
            height: MediaQuery.of(context).size.height * 0.18,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: NetworkImage(product.imageUrl ?? ""),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Expanded(
            child: SizedBox(
              child: Column(
                spacing: 8,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.productName ?? " empty",
                    style: TextStyles.medium15.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    '\$${product.price ??  "0"}  ',
                    style: TextStyles.semiBold14.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomCounter(),
                      IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          showButtomModalSheet(
                            context,
                            onDeletePressed: () async {
                              Navigator.pop(context);
                              await context.read<HomeCubit>().deleteFavorite(productId: product.productId!);
                            },
                          );
                        },
                        icon: Image.asset('assets/trash.png'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


