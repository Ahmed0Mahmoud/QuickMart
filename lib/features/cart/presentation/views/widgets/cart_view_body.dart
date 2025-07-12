import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_mart/features/home/presentation/manager/ProductDetailsCubit/product_details_cubit.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/widgets/custom_button.dart';
import 'cart_product.dart';

class CartViewBody extends StatefulWidget {
  const CartViewBody({super.key});

  @override
  State<CartViewBody> createState() => _CartViewBodyState();
}

class _CartViewBodyState extends State<CartViewBody> {

  @override
  void initState() {
    super.initState();
    loadCachedCartProducts();
  }

  loadCachedCartProducts(){
    context.read<ProductDetailsCubit>().loadCartProducts();
    context.read<ProductDetailsCubit>().getTotalPrice();
  }
  @override
  Widget build(BuildContext context) {
    final cartProducts = context.watch<ProductDetailsCubit>().cartProducts;
    final totalPrice = context.watch<ProductDetailsCubit>().totalProice;

    return cartProducts.isEmpty ? Center(child: Text('The Cart Is Empty.',style: TextStyles.semiBold18,),)  :Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ).copyWith(top: 60, bottom: 10),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ListView.builder(
                    physics:
                        NeverScrollableScrollPhysics(), // Prevents inner scrolling
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: CartProduct(product:cartProducts[index] ,),
                      );
                    },
                    itemCount: cartProducts.length,
                    shrinkWrap:
                        true, // Allows ListView to size itself based on content
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 12,
              children: [
                Text('Order Info', style: TextStyles.medium15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Subtotal',
                      style: TextStyles.regular13.copyWith(
                        color: AppColors.grey150,
                      ),
                    ),
                    Text(
                      '\$$totalPrice',
                      style: TextStyles.regular13.copyWith(
                        color: AppColors.grey150,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Shipping Cost',
                      style: TextStyles.regular13.copyWith(
                        color: AppColors.grey150,
                      ),
                    ),
                    Text(
                      '\$30',
                      style: TextStyles.regular13.copyWith(
                        color: AppColors.grey150,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total',
                      style: TextStyles.regular13.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                    Text(
                      '\$${totalPrice+30}',
                      style: TextStyles.regular13.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
                CustomButton(
                  title: Text(
                    'Checkout (2)',
                    style: TextStyles.medium14.copyWith(color: AppColors.white),
                  ),
                  onPressed: () {},
                  color: AppColors.cyan,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
