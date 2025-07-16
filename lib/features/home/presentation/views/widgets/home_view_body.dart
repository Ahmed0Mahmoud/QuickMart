import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_mart/core/widgets/custom_app_bar.dart';
import 'package:quick_mart/features/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:quick_mart/features/home/presentation/views/search_view.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/widgets/show_dialog.dart';
import '../../../data/models/product_model/product_model.dart';
import 'categories_listview.dart';
import 'latest_products_listview.dart';
import 'offers_listview.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> with RouteAware  {
  final _searchController = TextEditingController();
  bool _isFirstBuild = true;
  late HomeCubit cubit;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_isFirstBuild) {
       cubit = context.read<HomeCubit>();
       cubit.loadFavoritesFromCache();
       cubit.getAllProducts();
      _isFirstBuild = false;
    }
  }

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
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
        } else if (state is SearchProductsSuccess) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => SearchView(products: state.products),
            ),
          ).then((_) {
            cubit

              .getAllProducts();
          });
        } else if (state is SearchProductsFailure) {
          showAnimatedSnackbar(
            context: context,
            message: 'There was an error, try again',
            type: AnimatedSnackBarType.error,
          );
        } else if (state is SetFavoriteSuccess || state is DeleteFavoriteSuccess) {
          cubit.getAllProducts();
        }
      },
      builder: (context, state) {
        final isLoading = state is! GetAllProductsSuccess;
        final List<ProductModel> products = state is GetAllProductsSuccess ? state.product : [];

        return Skeletonizer(
          enabled: isLoading,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(bottom: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomAppBar(
                    searchIconVisible: true,
                    hintText: 'Search here...',
                    isDense: false,
                    controller: _searchController,
                    onPressed: () async {
                      final searchText = _searchController.text.trim();
                      if (searchText.isNotEmpty) {
                        FocusScope.of(context).unfocus();
                        await context.read<HomeCubit>().searchProduct(
                          productName: searchText,
                        );
                        _searchController.clear();
                      }
                    },
                  ),
                  OffersListView(models: products),
                  const SizedBox(height: 34),
                  Text('Categories', style: TextStyles.bold19),
                  const SizedBox(height: 12),
                  CategoriesListView(products: products),
                  const SizedBox(height: 34),
                  Text('Latest Products', style: TextStyles.bold19),
                  const SizedBox(height: 12),
                  LatestProductsGridView(products: products),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

}
