import 'package:flutter/material.dart';
import 'package:quick_mart/core/utils/app_colors.dart';
import 'package:quick_mart/core/widgets/custom_button.dart';
import 'package:quick_mart/features/home/presentation/views/widgets/favorites_button.dart';

import '../../../../../core/utils/app_text_styles.dart';
class ProductDetailsViewBody extends StatelessWidget {
  const ProductDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Stack(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height*0.38,
                child: Image.asset('assets/Rectangle 9 (3).png',fit: BoxFit.cover,),
              ),
              Positioned(
                right: 16,
                  top: 55,
                  child: FavoriteButton(),
              ),
              Positioned(
                  top: MediaQuery.of(context).size.height*0.33,
                  bottom: 0,
                  child: Expanded(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: AppColors.black,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15,vertical: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(child: Text('Loop Silicone Strong Magnetic watch',maxLines: 2,style: TextStyles.bold19,)),
                                const SizedBox(width: 10,),
                                Text('\$ 154.25',style: TextStyles.bold19,),
                              ],
                            ),
                            const SizedBox(height: 20,),
                            Expanded(child: Text('Constructed with high-quality silicone material, the Loop Silicone Strong Magnetic Watch ensures a comfortable and secure fit on your wrist. The soft and flexible silicone is gentle on the skin, making it ideal for... Read more',maxLines: 5,overflow: TextOverflow.ellipsis,style: TextStyles.regular14.copyWith(color: AppColors.grey150),)),
                            Row(
                              spacing: 20,
                              children: [
                                Expanded(child: CustomButton(title: Text('Buy Now',style: TextStyles.semiBold16.copyWith(color: AppColors.cyan),), onPressed: (){}, color: AppColors.grey50)),
                                Expanded(
                                  child: CustomButton(title: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    spacing: 8,
                                    children: [
                                      Text('Add To Cart',style: TextStyles.semiBold16),
                                      Image.asset('assets/shopping-cart (1).png'),
                                    ],
                                  ), onPressed: (){}, color: AppColors.cyan),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    
                    
                    ),
                  ),
              ),
            ],
          ),
        )
      ],


    );
  }
}
