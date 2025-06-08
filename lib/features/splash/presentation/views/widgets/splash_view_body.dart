import 'package:flutter/material.dart';
import 'package:quick_mart/constants.dart';
import 'package:quick_mart/core/helpers/cache_helper.dart';
import 'package:quick_mart/features/auth/presentation/views/login_view.dart';
import 'package:quick_mart/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../home/presentation/views/main_view.dart';
class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
   _splashdelay();
    super.initState();
  }
  _splashdelay()async{
    await Future.delayed(Duration(seconds: 2));
    if (Supabase.instance.client.auth.currentUser !=null){
      Navigator.pushReplacementNamed(context, MainView.routeName);
    }
    else if(CacheHelper().getData(key: '${AppConstants().onBoardingShawed}')==true){
      Navigator.pushReplacementNamed(context, LoginView.routeName);
    }

    else{
      Navigator.pushReplacementNamed(context, OnBoardingView.routeName);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width*0.8,
            child: Image(
                image: AssetImage('assets/quickmart.png'),
                 fit: BoxFit.cover,
            ),
          ),
        )
      ],

    );
  }
}
