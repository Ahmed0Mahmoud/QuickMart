import 'package:flutter/material.dart';
import 'package:quick_mart/core/helpers/cache_helper.dart';
import 'package:quick_mart/core/helpers/on_generate_route.dart';
import 'package:quick_mart/features/splash/presentation/views/splash_view.dart';

import 'core/utils/app_colors.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  CacheHelper().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(
        useMaterial3: true
      ).copyWith(
        scaffoldBackgroundColor: AppColors.black,
        appBarTheme: AppBarTheme(
            backgroundColor:AppColors.black,
        )
      ),
      onGenerateRoute: onGenerateRoute,
      initialRoute: SplashView.routeName,

    );
  }
}


