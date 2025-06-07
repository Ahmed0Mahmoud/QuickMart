import 'package:flutter/material.dart';
import 'package:quick_mart/features/on_boarding/presentation/views/widgets/on_boarding_body.dart';
class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});
static const routeName = 'onBoarding';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: OnBoardingBody()),
    );
  }
}
