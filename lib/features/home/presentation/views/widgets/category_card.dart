import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 90,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.cyan,
        border: Border.all(width: 1, color: AppColors.grey50),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 30, child: Image.asset('assets/IndustrialIcon.png')),
          Text('Industrial', style: TextStyles.semiBold14),
        ],
      ),
    );
  }
}
