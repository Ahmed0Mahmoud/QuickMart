import 'package:flutter/material.dart';
import 'package:quick_mart/features/home/presentation/views/widgets/home_view_body.dart';


class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const routeName = 'home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: HomeViewBody()
    );
  }
}
