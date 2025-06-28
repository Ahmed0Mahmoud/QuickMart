import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_mart/core/helpers/cache_helper.dart';
import 'package:quick_mart/core/helpers/my_observer.dart';
import 'package:quick_mart/core/helpers/on_generate_route.dart';
import 'package:quick_mart/core/sensetive_data.dart';
import 'package:quick_mart/features/splash/presentation/views/splash_view.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'core/utils/app_colors.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: ProjectUrl,
    anonKey: anonKey,
  );
  CacheHelper().init();
  Bloc.observer = MyObserver();
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


