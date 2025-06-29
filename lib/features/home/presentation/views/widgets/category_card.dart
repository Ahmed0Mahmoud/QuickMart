import 'package:flutter/material.dart';
import 'package:quick_mart/features/home/presentation/views/category_products_view.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../data/models/category_model.dart';


class CategoryCard extends StatelessWidget {
  final CategoryModel category;

  const CategoryCard({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, CategoryProductsView.routeName , arguments:category );
      },
      child: IntrinsicWidth(
        child: Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width*0.25,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: category.backgroundColor,
            border: Border.all(width: 1, color: AppColors.grey50),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 30, child: Image.asset(category.imageAsset)),
              Text(category.title, style: TextStyles.semiBold16),
            ],
          ),
        ),
      ),
    );
  }
}



final List<CategoryModel> categories = [
  CategoryModel(
    title: 'Industrial',
    imageAsset: 'assets/IndustrialIcon.png',
    backgroundColor: AppColors.cyan,
  ),
  CategoryModel(
    title: 'Electronics',
    imageAsset: 'assets/phoneicon.png',
    backgroundColor: AppColors.orange,
  ),
  CategoryModel(
    title: 'Fashion',
    imageAsset: 'assets/fashionIcon.png',
    backgroundColor: AppColors.pink,
  ),
  CategoryModel(
    title: 'Furniture',
    imageAsset: 'assets/furniture.png',
    backgroundColor: AppColors.blue,
  ),
];

