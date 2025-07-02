import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_mart/core/utils/app_colors.dart';
import 'package:quick_mart/core/widgets/custom_button.dart';
import 'package:quick_mart/core/widgets/show_dialog.dart';
import 'package:quick_mart/features/home/presentation/manager/ProductDetailsCubit/product_details_cubit.dart';
import 'package:quick_mart/features/home/presentation/views/widgets/favorites_button.dart';
import 'package:quick_mart/features/home/presentation/views/widgets/rating_widget.dart';

import '../../../../../core/utils/app_text_styles.dart';
import '../../../data/models/product_model/product_model.dart';

class ProductDetailsViewBody extends StatefulWidget {
  final ProductModel model;
  const ProductDetailsViewBody({super.key, required this.model});

  @override
  State<ProductDetailsViewBody> createState() => _ProductDetailsViewBodyState();
}

class _ProductDetailsViewBodyState extends State<ProductDetailsViewBody> {

  late ProductDetailsCubit _productDetailsCubit;

  @override
  void initState() {
    super.initState();
    _productDetailsCubit = context.read<ProductDetailsCubit>();
    Future.microtask(loadRates);
  }

  @override
  void dispose() {
    super.dispose();
  }

  void loadRates() async {
    _productDetailsCubit.clearRates();
    await _productDetailsCubit.getRates(productId: widget.model.productId!);
  }
  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  // }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductDetailsCubit, ProductDetailsState>(
      listener: (context, state) {
         if (state is PostRateSuccess){
          if (context.mounted) {
            showAnimatedSnackbar(
              context: context,
              message: 'Thanks for rating!',
              type: AnimatedSnackBarType.success,
            );
          }
        }

        else if (state is PostRateFailure) {
          if (context.mounted) {
            showAnimatedSnackbar(
              context: context,
              message: 'Failed to submit rating',
              type: AnimatedSnackBarType.error,
            );
          }
        }
      },
        builder: (context, state) {
          final isLoading = state is GetRateLoading ;
          final isSuccess = state is GetRateSuccess || state is PostRateSuccess;

          return isLoading
              ? const Center(child: CircularProgressIndicator())
              : Column(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.35,
                      child: Image.network(widget.model.imageUrl!,
                          fit: BoxFit.fill),
                    ),
                    const Positioned(
                        right: 16, top: 35, child: FavoriteButton(size: 28)),
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
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      widget.model.productName!,
                                      maxLines: 2,
                                      style: TextStyles.bold19,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Text('\$${widget.model.price}',
                                      style: TextStyles.bold19),
                                ],
                              ),
                              const SizedBox(height: 20),
                              Text(
                                widget.model.description!,
                                maxLines: 5,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyles.regular14
                                    .copyWith(color: AppColors.grey150),
                              ),
                              const SizedBox(height: 20),
                              isSuccess
                                  ? RatingWidget(
                                averageRate:
                                _productDetailsCubit.averageRate,
                                userRate: _productDetailsCubit.userRate
                                    .toDouble(),
                                productId: widget.model.productId!,
                              )
                                  : Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceAround,
                                children: [
                                  Expanded(
                                    child: CustomButton(
                                      title: Text(
                                        'Buy Now',
                                        style: TextStyles.semiBold16
                                            .copyWith(
                                            color: AppColors.cyan),
                                      ),
                                      onPressed: () {},
                                      color: AppColors.grey50,
                                    ),
                                  ),
                                  const SizedBox(width: 20),
                                  Expanded(
                                    child: CustomButton(
                                      title: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Add To Cart',
                                            style: TextStyles.semiBold16,
                                          ),
                                          const SizedBox(width: 8),
                                          Image.asset(
                                              'assets/shopping-cart (1).png'),
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
    );
  }
}