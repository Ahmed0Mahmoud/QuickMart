import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/widgets/custom_button.dart';
import 'cart_product.dart';
class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(top: 60,bottom: 10),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(), // Prevents inner scrolling
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: CartProduct(),
                      );
                    },
                    itemCount: 2,
                    shrinkWrap: true, // Allows ListView to size itself based on content
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
                Text('Order Info',style: TextStyles.medium15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Subtotal',style: TextStyles.regular13.copyWith(color: AppColors.grey150),),
                    Text('\$27.25',style: TextStyles.regular13.copyWith(color: AppColors.grey150),),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Shipping Cost',style: TextStyles.regular13.copyWith(color: AppColors.grey150),),
                    Text('\$0.00',style: TextStyles.regular13.copyWith(color: AppColors.grey150),),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Total',style: TextStyles.regular13.copyWith(color: AppColors.white),),
                    Text('\$27.25',style: TextStyles.regular13.copyWith(color: AppColors.white),),
                  ],
                ),
                CustomButton(
                    title: Text('Checkout (2)',style: TextStyles.medium14.copyWith(color: AppColors.white),),
                    onPressed: (){},
                    color: AppColors.cyan
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}



