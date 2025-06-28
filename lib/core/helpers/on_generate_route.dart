import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_mart/core/network/dio_consumer.dart';
import 'package:quick_mart/features/auth/presentation/manager/auth_cubit.dart';
import 'package:quick_mart/features/cart/presentation/views/cart_view.dart';
import 'package:quick_mart/features/home/presentation/manager/home_cubit.dart';
import 'package:quick_mart/features/home/presentation/views/product_details_view.dart';
import 'package:quick_mart/features/profile/presentation/views/profile_view.dart';
import 'package:quick_mart/features/wishlist/presentation/views/wishlist_view.dart';

import '../../features/auth/presentation/views/login_view.dart';
import '../../features/auth/presentation/views/signup_view.dart';
import '../../features/home/data/models/product_model/product_model.dart';
import '../../features/home/presentation/views/home_view.dart';
import '../../features/home/presentation/views/main_view.dart';
import '../../features/on_boarding/presentation/views/on_boarding_view.dart';
import '../../features/splash/presentation/views/splash_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (context) => const SplashView());

    case OnBoardingView.routeName:
      return MaterialPageRoute(builder: (context) => const OnBoardingView());

    case LoginView.routeName:
      return MaterialPageRoute(
        builder:
            (context) => BlocProvider(
              create: (context) => AuthCubit(),
              child: LoginView(),
            ),
      );

    case SignupView.routeName:
      return MaterialPageRoute(
        builder:
            (context) => BlocProvider(
              create: (context) => AuthCubit(),
              child: SignupView(),
            ),
      );

    case HomeView.routeName:
      return MaterialPageRoute(builder: (context) => HomeView());

    case ProductDetailsView.routeName:
      final model = settings.arguments as ProductModel;
      return MaterialPageRoute(builder: (context) => ProductDetailsView(model: model,));

    case MainView.routeName:
      return MaterialPageRoute(
        builder:
            (context) => MultiBlocProvider(
              providers: [
                BlocProvider(create:(context) => AuthCubit(),),
                BlocProvider(create:(context) => HomeCubit(DioConsumer(dio: Dio())),),
              ],
              child: MainView(),
            ),
      );

    case CartView.routeName:
      return MaterialPageRoute(builder: (context) => CartView());

    case WishlistView.routeName:
      return MaterialPageRoute(builder: (context) => WishlistView());

    case ProfileView.routeName:
      return MaterialPageRoute(builder: (context) => ProfileView());

    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
