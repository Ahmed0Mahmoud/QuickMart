import 'package:flutter/material.dart';
import 'package:quick_mart/core/utils/app_colors.dart';
import 'package:quick_mart/core/widgets/custom_button.dart';
import 'package:quick_mart/features/home/presentation/views/widgets/favorites_button.dart';
import 'package:quick_mart/features/home/presentation/views/widgets/rating_widget.dart';

import '../../../../../core/utils/app_text_styles.dart';
import '../../../data/models/product_model/product_model.dart';

class ProductDetailsViewBody extends StatelessWidget {
  final ProductModel model;
  const ProductDetailsViewBody({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Stack(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.35,
                child: Image.network(
                  model.imageUrl!,
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(right: 16, top: 35, child: FavoriteButton(size: 28,)),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.335,
                bottom: 0,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: AppColors.black,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 30,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                model.productName!,
                                maxLines: 2,
                                style: TextStyles.bold19,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Text('\$${model.price}', style: TextStyles.bold19),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Text(
                          model.description!,
                          maxLines: 5,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyles.regular14.copyWith(
                            color: AppColors.grey150,
                          ),
                        ),
                        Expanded(
                            child: RatingWidget(),
                        ),
                        Row(
                          spacing: 20,
                          children: [
                            Expanded(
                              child: CustomButton(
                                title: Text(
                                  'Buy Now',
                                  style: TextStyles.semiBold16.copyWith(
                                    color: AppColors.cyan,
                                  ),
                                ),
                                onPressed: () {},
                                color: AppColors.grey50,
                              ),
                            ),
                            Expanded(
                              child: CustomButton(
                                title: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  spacing: 8,
                                  children: [
                                    Text(
                                      'Add To Cart',
                                      style: TextStyles.semiBold16,
                                    ),
                                    Image.asset(
                                      'assets/shopping-cart (1).png',
                                    ),
                                  ],
                                ),
                                onPressed: () {},
                                color: AppColors.cyan,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
