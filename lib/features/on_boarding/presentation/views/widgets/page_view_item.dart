import 'package:flutter/material.dart';
import 'package:quick_mart/constants.dart';
import 'package:quick_mart/core/helpers/cache_helper.dart';
import 'package:quick_mart/core/utils/app_colors.dart';

import '../../../../../core/utils/app_text_styles.dart';
import '../../../../auth/presentation/views/login_view.dart';

class PageViewItem extends StatelessWidget {
  final String image;
  final String title;
  final String subTitle;
  final bool isVisible;

  const PageViewItem({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
    required this.isVisible,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: size.width,
            decoration: BoxDecoration(
              color: AppColors.lightBlack,
              borderRadius: BorderRadius.circular(32),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(18, 25, 18, 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset('assets/quickmart (1).png'),
                      isVisible
                          ? TextButton(
                            onPressed: () async {
                              await CacheHelper().saveData(
                                key: '${AppConstants().onBoardingShawed}',
                                value: true,
                              );
                              Navigator.pushReplacementNamed(
                                context,
                                LoginView.routeName,
                              );
                            },
                            child: Text(
                              'Skip for now',
                              style: TextStyles.regular14.copyWith(
                                color: AppColors.cyan,
                              ),
                            ),
                          )
                          : const SizedBox.shrink(),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.3,
                  child: Image.asset(image, fit: BoxFit.contain),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
          const SizedBox(height: 64),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35),
            child: Text(
              title,
              style: TextStyles.bold24,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35),
            child: Text(
              subTitle,
              style: TextStyles.regular14,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
