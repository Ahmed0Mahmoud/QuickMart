import 'package:flutter/material.dart';
import 'package:quick_mart/core/widgets/custom_app_bar.dart';

import '../../../../../core/utils/app_text_styles.dart';
import 'categories_listview.dart';
import 'latest_products_listview.dart';
import 'offers_listview.dart';
class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(bottom: 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(searchIconVisible: true),
            OffersListView(),
            const SizedBox(height: 34),
            Text('Categories',style: TextStyles.bold19,),
            const SizedBox(height: 12),
            CategoriesListView(),
            const SizedBox(height: 34),
            Text('Latest Products',style: TextStyles.bold19,),
            const SizedBox(height: 12),
            LatestProductsGridView(),
          ],

        ),
      ),
    );
  }
}






