import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_mart/core/widgets/custom_app_bar.dart';
import 'package:quick_mart/features/home/presentation/manager/home_cubit.dart';

import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/widgets/show_dialog.dart';
import 'categories_listview.dart';
import 'latest_products_listview.dart';
import 'offers_listview.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {

  @override
  void initState() {
    super.initState();
    getProducts();
  }

  void getProducts()async{
    await context.read<HomeCubit>().getAllProducts();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is HomeFailure) {
          showAnimatedSnackbar(
            context: context,
            message: 'get data error',
            type: AnimatedSnackBarType.error,
          );
        }
      },
      builder: (context, state) {
        final isLoading = state is HomeLoading;
        final isError = state is HomeFailure;
        final isSuccess = state is HomeSuccess;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(bottom: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomAppBar(searchIconVisible: true),
                const OffersListView(),
                const SizedBox(height: 34),
                Text('Categories', style: TextStyles.bold19),
                const SizedBox(height: 12),
                const CategoriesListView(),
                const SizedBox(height: 34),
                Text('Latest Products', style: TextStyles.bold19),
                const SizedBox(height: 12),
                if (isLoading)
                  const Center(child: CircularProgressIndicator()),
                if (isSuccess)
                  LatestProductsGridView(products: state.product),
                if (isError)
                  const Text('Failed to load products', style: TextStyle(color: Colors.red)),
              ],
            ),
          ),
        );
      },
    );
  }

}
