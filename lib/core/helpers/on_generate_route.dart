import 'package:flutter/material.dart';
import 'package:quick_mart/features/cart/presentation/views/cart_view.dart';
import 'package:quick_mart/features/home/presentation/views/product_details_view.dart';
import 'package:quick_mart/features/profile/presentation/views/profile_view.dart';
import 'package:quick_mart/features/wishlist/presentation/views/wishlist_view.dart';

import '../../features/auth/presentation/views/login_view.dart';
import '../../features/auth/presentation/views/signup_view.dart';
import '../../features/home/presentation/views/home_view.dart';
import '../../features/home/presentation/views/main_view.dart';
import '../../features/on_boarding/presentation/views/on_boarding_view.dart';
import '../../features/splash/presentation/views/splash_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings){
  switch(settings.name){
    case SplashView.routeName :
      return MaterialPageRoute(builder: (context) => const SplashView());

    case OnBoardingView.routeName :
      return MaterialPageRoute(builder: (context) => const OnBoardingView());

    case LoginView.routeName :
      return MaterialPageRoute(builder: (context)=> LoginView());

    case SignupView.routeName :
      return MaterialPageRoute(builder: (context)=>SignupView());

    case HomeView.routeName :
      return MaterialPageRoute(builder: (context)=>HomeView());

    case ProductDetailsView.routeName :
      return MaterialPageRoute(builder: (context)=>ProductDetailsView());

    case MainView.routeName :
      return MaterialPageRoute(builder: (context)=>MainView());

    case CartView.routeName :
      return MaterialPageRoute(builder: (context)=>CartView());

    case WishlistView.routeName :
      return MaterialPageRoute(builder: (context)=>WishlistView());

    case ProfileView.routeName :
      return MaterialPageRoute(builder: (context)=>ProfileView());

    default :
     return MaterialPageRoute(builder: (context)=>const Scaffold());
  }

}