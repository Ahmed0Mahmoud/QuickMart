import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_mart/features/home/data/models/product_model/product_model.dart';
import 'package:quick_mart/features/home/presentation/manager/ProductDetailsCubit/product_details_cubit.dart';

import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/widgets/custom_counter.dart';
import '../../../../../core/widgets/show_buttom_modal_sheet.dart';

class CartProduct extends StatelessWidget {
  final ProductModel product;
  const CartProduct({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.18,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 15,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.35,
            height: MediaQuery.of(context).size.height * 0.18,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: NetworkImage(product.imageUrl!),
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
                    product.productName!,
                    style: TextStyles.medium15.copyWith(color: Colors.white),
                  ),
                  Text(
                    '\$${product.price}',
                    style: TextStyles.semiBold14.copyWith(color: Colors.white),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomCounter(),
                      IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          showButtomModalSheet(context, onDeletePressed: () async{
                            Navigator.pop(context);
                            await context.read<ProductDetailsCubit>().deleteFromCart(product: product);
                             context.read<ProductDetailsCubit>().getTotalPrice();
                          });
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
