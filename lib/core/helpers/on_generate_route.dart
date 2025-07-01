import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_mart/core/utils/service_locator.dart';
import 'package:quick_mart/features/auth/presentation/manager/auth_cubit.dart';
import 'package:quick_mart/features/cart/presentation/views/cart_view.dart';
import 'package:quick_mart/features/home/data/models/category_model/category_model.dart';
import 'package:quick_mart/features/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:quick_mart/features/home/presentation/views/category_products_view.dart';
import 'package:quick_mart/features/home/presentation/views/product_details_view.dart';
import 'package:quick_mart/features/profile/presentation/views/profile_view.dart';
import 'package:quick_mart/features/wishlist/presentation/views/wishlist_view.dart';

import '../../features/auth/presentation/views/login_view.dart';
import '../../features/auth/presentation/views/signup_view.dart';
import '../../features/home/data/models/product_model/product_model.dart';
import '../../features/home/presentation/manager/ProductDetailsCubit/product_details_cubit.dart';
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
              create: (context) => getIt.get<AuthCubit>(),
              child: LoginView(),
            ),
      );

    case SignupView.routeName:
      return MaterialPageRoute(
        builder:
            (context) => BlocProvider(
              create: (context) => getIt.get<AuthCubit>(),
              child: SignupView(),
            ),
      );

    case HomeView.routeName:
      return MaterialPageRoute(builder: (context) => HomeView());

    case ProductDetailsView.routeName:
      final model = settings.arguments as ProductModel;
      return MaterialPageRoute(
        builder: (context) => BlocProvider.value(
        value: getIt.get<ProductDetailsCubit>(),
        child: ProductDetailsView(model: model),
      ),
      );

    case MainView.routeName:
      return MaterialPageRoute(
        builder:
            (context) => MultiBlocProvider(
              providers: [
                BlocProvider.value(value: getIt.get<AuthCubit>()),
                BlocProvider.value(value: getIt.get<HomeCubit>()),
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

    case CategoryProductsView.routeName:
      final category = settings.arguments as CategoryModel;
      return MaterialPageRoute(
        builder:
            (context) => BlocProvider.value(
              value: getIt.get<HomeCubit>(),
              child: CategoryProductsView(category: category),
            ),
      );

    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
