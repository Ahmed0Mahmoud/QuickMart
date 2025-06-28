import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:quick_mart/constants.dart';
import 'package:quick_mart/core/helpers/cache_helper.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../auth/presentation/views/login_view.dart';
import 'on_boarding_pageview.dart';

class OnBoardingBody extends StatefulWidget {
  const OnBoardingBody({super.key});

  @override
  State<OnBoardingBody> createState() => _OnBoardingBodyState();
}

class _OnBoardingBodyState extends State<OnBoardingBody> {
  late PageController controller;
  var currentPage = 0;

  @override
  void initState() {
    controller = PageController();
    controller.addListener(() {
      setState(() {
        currentPage = controller.page!.round();
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: OnBoardingPageView(controller: controller)),
        DotsIndicator(
          position: currentPage.toDouble(),
          reversed: false,
          dotsCount: 2,
          animate: true,
          animationDuration: Duration(milliseconds: 170),
          decorator: DotsDecorator(
            activeColor: AppColors.cyan,
            color: AppColors.grey100,
            size: Size(11, 11),
            activeSize: Size(11, 11),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
          child: Visibility(
            visible: currentPage == 1 ? true : false,
            maintainAnimation: true,
            maintainSize: true,
            maintainState: true,
            child: CustomButton(
              title: Text(
                'Get Started',
                style: TextStyles.bold16.copyWith(color: Colors.white),
              ),
              onPressed: () async {
                await CacheHelper().saveData(
                  key: '${AppConstants().onBoardingShawed}',
                  value: true,
                );
                Navigator.pushReplacementNamed(context, LoginView.routeName);
              },
              color: AppColors.cyan,
            ),
          ),
        ),
      ],
    );
  }
}
