import 'package:flutter/material.dart';
import 'package:quick_mart/features/home/presentation/views/widgets/product_card.dart';


class LatestProductsGridView extends StatelessWidget {
  const LatestProductsGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: GridView.builder(
          padding: EdgeInsets.zero,
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 4,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,crossAxisSpacing: 9,mainAxisSpacing: 12,childAspectRatio: 0.7),
          itemBuilder: (context,index){
            return ProductCard();
          }
      ),
    );
  }
}
