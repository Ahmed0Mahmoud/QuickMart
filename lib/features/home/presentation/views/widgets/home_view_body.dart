import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_mart/core/widgets/custom_app_bar.dart';
import 'package:quick_mart/features/home/presentation/manager/home_cubit/home_cubit.dart';

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
    Future.microtask(() {
      final cubit = context.read<HomeCubit>();
      cubit.getAllProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is GetAllProductsFailure) {
          showAnimatedSnackbar(
            context: context,
            message: 'Failed to load data',
            type: AnimatedSnackBarType.error,
          );
        }
      },
      builder: (context, state) {
        if (state is GetAllProductsLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is GetAllProductsSuccess) {
          final products = state.product;
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ).copyWith(bottom: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomAppBar(searchIconVisible: true),
                  OffersListView(models: state.product),
                  const SizedBox(height: 34),
                  Text('Categories', style: TextStyles.bold19),
                  const SizedBox(height: 12),
                  CategoriesListView(products: products),
                  const SizedBox(height: 34),
                  Text('Latest Products', style: TextStyles.bold19),
                  const SizedBox(height: 12),
                  products.isEmpty
                      ? const Text('No products available')
                      : LatestProductsGridView(products: products),
                ],
              ),
            ),
          );
        }

        return const SizedBox(); // fallback
      },
    );
  }
}
