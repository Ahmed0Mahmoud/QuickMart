import 'dart:developer';

import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:pay_with_paymob/pay_with_paymob.dart';
import 'package:quick_mart/core/sensetive_data.dart';
import 'package:quick_mart/core/utils/app_colors.dart';
import 'package:quick_mart/core/widgets/custom_button.dart';
import 'package:quick_mart/core/widgets/show_dialog.dart';
import 'package:quick_mart/features/auth/presentation/manager/auth_cubit.dart';
import 'package:quick_mart/features/home/presentation/manager/ProductDetailsCubit/product_details_cubit.dart';
import 'package:quick_mart/features/home/presentation/views/widgets/commentInputField.dart';
import 'package:quick_mart/features/home/presentation/views/widgets/rating_widget.dart';

import '../../../../../core/utils/app_text_styles.dart';
import '../../../data/models/product_model/product_model.dart';
import 'comments_list_view.dart';

class ProductDetailsViewBody extends StatefulWidget {
  final ProductModel model;
  const ProductDetailsViewBody({super.key, required this.model});

  @override
  State<ProductDetailsViewBody> createState() => _ProductDetailsViewBodyState();
}

class _ProductDetailsViewBodyState extends State<ProductDetailsViewBody> {
  late ProductDetailsCubit _productDetailsCubit;


  late AuthCubit _authCubit;


  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _productDetailsCubit = context.read<ProductDetailsCubit>();
    _authCubit = context.read<AuthCubit>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      loadRates();
      getUserData();
    });
    PaymentData.initialize(
        apiKey: payMobApiKey, // Required: Found under Dashboard -> Settings -> Account Info -> API Key
        iframeId: payMobIframeId, // Required: Found under Developers -> iframes
        integrationCardId: payMobIntegrationCardId, // Required: Found under Developers -> Payment Integrations -> Online Card ID
        integrationMobileWalletId: payMobIntegrationMobileWalletId, // Required: Found under Developers -> Payment Integrations -> Mobile Wallet ID

      userData: UserData(
        email: _authCubit.userModel.email,
        name: _authCubit.userModel.name,
      ),

      style: Style(
        primaryColor: AppColors.cyan, // Default: Colors.blue
        scaffoldColor: AppColors.black, // Default: Colors.white
        appBarBackgroundColor: AppColors.cyan, // Default: Colors.blue
        appBarForegroundColor: Colors.white, // Default: Colors.white
        textStyle: TextStyle(), // Default: TextStyle()
        buttonStyle: ElevatedButton.styleFrom(
          backgroundColor: AppColors.cyan,
          foregroundColor: AppColors.white
        ), // Default: ElevatedButton.styleFrom()
        circleProgressColor: AppColors.cyan, // Default: Colors.blue
        unselectedColor: Colors.grey, // Default: Colors.grey
      ),


    );
  }


  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  void loadRates() async {
    _productDetailsCubit.clearRates();
    await _productDetailsCubit.getRates(productId: widget.model.productId!);
  }

  void getUserData() async {
    await _authCubit.getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductDetailsCubit, ProductDetailsState>(
      listener: (context, state) {
        if (state is PostRateSuccess) {
          if (context.mounted) {
            showAnimatedSnackbar(
              context: context,
              message: 'Thanks for rating!',
              type: AnimatedSnackBarType.success,
            );
          }
        } else if (state is PostRateFailure) {
          if (context.mounted) {
            showAnimatedSnackbar(
              context: context,
              message: 'Failed to submit rating',
              type: AnimatedSnackBarType.error,
            );
          }
        }
        else if(state is AddToCartSuccess){
          showAnimatedSnackbar(
            context: context,
            message: 'Done',
            type: AnimatedSnackBarType.success,
          );
        }
      },
      builder: (context, state) {

        return state is GetRateLoading || state is GetUserDataLoading ?
        Center(child: LoadingAnimationWidget.flickr(leftDotColor: AppColors.cyan, rightDotColor: AppColors.grey100, size: 80))
            : Column(
                      children: [
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        SizedBox(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
                          height: MediaQuery
                              .of(context)
                              .size
                              .height * 0.35,
                          child: Image.network(
                            widget.model.imageUrl!,
                            fit: BoxFit.fill,
                          ),
                        ),

                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 30,
                      ),
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      decoration: BoxDecoration(color: AppColors.black),
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
                              Text(
                                '\$${widget.model.price}',
                                style: TextStyles.bold19,
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 15,
                            ),
                            child: Text(
                              widget.model.description!,
                              maxLines: 5,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyles.regular14.copyWith(
                                color: AppColors.grey150,
                              ),
                            ),
                          ),


                          RatingWidget(
                            averageRate:
                            _productDetailsCubit.averageRate,
                            userRate:
                            _productDetailsCubit.userRate
                                .toDouble(),
                            productId: widget.model.productId!,
                          ),

                          CommentInputField(
                            controller: _controller,
                            hintText: 'Type your feedback',
                            onPressed: () async {
                              if (_controller.text.trim().isEmpty) return;
                              await _productDetailsCubit.addComment(
                                comment: _controller.text,
                                productId: widget.model.productId!,
                                userName: _authCubit.userModel.name,
                              );
                              _controller.clear();
                            },
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 15),
                            child: Text(
                              "comments",
                              style: TextStyles.semiBold18,
                            ),
                          ),
                          CommentsListView(model: widget.model),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
              ).copyWith(bottom: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: CustomButton(
                      title: Text(
                        'Buy Now',
                        style: TextStyles.semiBold16.copyWith(
                          color: AppColors.cyan,
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PaymentView(
                              onPaymentSuccess: () {
                                log('payment success');
                              },
                              onPaymentError: () {
                                log('payment failure');
                              },
                              price: double.tryParse(widget.model.price!.replaceAll(',', '')) ?? 0.0,
                            ),
                          ),
                        );


                      },
                      color: AppColors.grey50,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: CustomButton(
                      title:Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Add To Cart', style: TextStyles.semiBold16),
                          const SizedBox(width: 8),
                          Image.asset('assets/shopping-cart (1).png'),
                        ],
                      ),
                      onPressed: ()async {
                        await _productDetailsCubit.addToCart(product: widget.model);
                      },
                      color: AppColors.cyan,
                    ),
                  ),
                ],
              ),
            ),
                      ],
                    );
      },
    );
  }



}
