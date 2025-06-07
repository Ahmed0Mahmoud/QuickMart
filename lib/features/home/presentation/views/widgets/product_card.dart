import 'package:flutter/material.dart';
import 'package:quick_mart/features/home/presentation/views/product_details_view.dart';

import '../../../../../core/utils/app_text_styles.dart';
import 'favorites_button.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, ProductDetailsView.routeName,);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.height * 0.2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  image: const DecorationImage(
                    image: AssetImage('assets/Rectangle 9.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const Positioned(
                right: 6,
                top: 6,
                child: FavoriteButton(),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            'Nike air jordan retro fashion',
            style: TextStyles.medium14,
            overflow: TextOverflow.ellipsis,
          ),
          Text('\$126.00', style: TextStyles.semiBold13),
        ],
      ),
    );
  }
}
