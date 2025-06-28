import 'package:flutter/material.dart';
import 'package:quick_mart/core/utils/app_colors.dart';
import 'package:quick_mart/features/cart/presentation/views/cart_view.dart';
import 'package:quick_mart/features/home/presentation/views/home_view.dart';
import 'package:quick_mart/features/profile/presentation/views/profile_view.dart';
import 'package:quick_mart/features/wishlist/presentation/views/wishlist_view.dart';

import '../../../../core/utils/app_text_styles.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});
  static const routeName = 'main';

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int currentIndex = 0;

  final List<Widget> screens = [
    HomeView(),
    CartView(),
    WishlistView(),
    ProfileView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.black,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: TextStyles.semiBold14,
        selectedItemColor: AppColors.white,
        unselectedLabelStyle: TextStyles.semiBold14,
        unselectedItemColor: AppColors.grey150,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(currentIndex == 0 ? Icons.home : Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              currentIndex == 1
                  ? Icons.shopping_cart
                  : Icons.shopping_cart_outlined,
            ),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              currentIndex == 2
                  ? Icons.favorite
                  : Icons.favorite_border_outlined,
            ),
            label: 'Wishlist',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              currentIndex == 3 ? Icons.person_2 : Icons.person_2_outlined,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
