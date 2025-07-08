import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';
import 'custom_button.dart';

showButtomModalSheet(context,{required void Function() onDeletePressed}) {

  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.black,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Delete product from wishlist',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            const SizedBox(height: 20),
            CustomButton(
              title: Text(
                'Delete (1) product',
                style: TextStyles.regular14.copyWith(color: Colors.white),
              ),
              onPressed: onDeletePressed,
              color: AppColors.cyan,
            ),
            const SizedBox(height: 10),
            CustomButton(
              title: Text(
                'Cancel',
                style: TextStyles.regular14.copyWith(color: AppColors.cyan),
              ),
              onPressed: () => Navigator.pop(context),
              color: AppColors.grey50,
            ),
          ],
        ),
      );
    },
  );
}
